import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/errors/auth_error.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/secure_storage_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';

class AuthService with ListenableServiceMixin {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _networkService = locator<NetworkService>();
  final _secureStorageService = locator<SecureStorageService>();
  final _isAuthenticated = ReactiveValue<bool>(false);
  final _isEmailVerified = ReactiveValue<bool>(false);
  final _currentUser = ReactiveValue<User?>(null);

  AuthService() {
    listenToReactiveValues([_isAuthenticated, _isEmailVerified, _currentUser]);
  }

  User? get currentUser => _currentUser.value;
  bool get isAuthenticated => _isAuthenticated.value;
  bool get isEmailVerified => _isEmailVerified.value;

  Future<void> checkAuthenticated() async {
    final firebaseUser = _firebaseAuth.currentUser;

    final localUserString = await _secureStorageService.read(kAuthUser);

    if (firebaseUser != null) {
      final localUserStringDynamic = localUserString as dynamic;
      final localUser = User.fromJson(jsonDecode(localUserStringDynamic));
      _isAuthenticated.value = true;
      _currentUser.value = User(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName!,
        email: firebaseUser.email!,
        verified: firebaseUser.emailVerified,
        avatar: localUser.avatar,
      );
      notifyListeners();
    } else {
      await _secureStorageService.deleteAll();
      _isAuthenticated.value = false;
      _currentUser.value = null;
      notifyListeners();
    }
  }

  Future<Option<Either<AuthError, bool>>> checkEmailVerified() async {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      _isEmailVerified.value == false;
      notifyListeners();
      return optionOf(null);
    }

    await firebaseUser.reload();

    if (firebaseUser.emailVerified) {
      _isEmailVerified.value = true;
      notifyListeners();
      return optionOf(right(true));
    } else {
      _isEmailVerified.value = false;
      notifyListeners();
      return optionOf(left(const AuthError.notVerified()));
    }
  }

  Future<Either<AuthError, Unit>> deleteAccount() async {
    final firebaseUser = _firebaseAuth.currentUser!;
    try {
      await deleteProfileImage();
      await deleteAccountFavourites();
      await userRef.doc(firebaseUser.uid).delete();
      await _secureStorageService.deleteAll();
      return await firebaseUser.delete().then((value) => right(unit));
    } on fb.FirebaseAuthException {
      return left(const AuthError.serverError());
    }
  }

  Future<Either<AuthError, Unit>> deleteAccountFavourites() async {
    final fBase = FirebaseFirestore.instance;
    final batch = fBase.batch();

    final uid = _firebaseAuth.currentUser!.uid;
    final ref = fBase.collection('users').doc(uid).collection('favourites');

    try {
      final query = await ref.get();
      final list = query.docs.map((e) => Favourite.fromJson(e.data())).toList();
      for (var item in list) {
        batch.delete(ref.doc('${item.uid}'));
      }
      batch.commit();
      return right(unit);
    } on fb.FirebaseAuthException {
      return left(const AuthError.serverError());
    }
  }

  Future<Either<AuthError, Unit>> deleteProfileImage() async {
    final uid = _firebaseAuth.currentUser?.uid;
    final imageRef = _firebaseStorage.ref().child('images/avatar/$uid');

    try {
      await imageRef.delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(AuthError.error(e.message));
    }
  }

  Future<Either<AuthError, Unit>> forgotPassword(String email) async {
    try {
      // Send password reset email using Firebase authentication.
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthError.userNotFound());
        case 'invalid-email':
          return left(const AuthError.invalidEmail());
        default:
          return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> googleLogin() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const AuthError.noNetworkConnection());
    }

    try {
      // Sign out any existing Google accounts
      // await _googleSignIn.signOut();

      // Sign in to the user's Google account
      final GoogleSignInAccount? gAccount = await _googleSignIn.signIn();

      // Return an error if no Google account was found
      if (gAccount == null) {
        return left(const AuthError.noGoogleAccount());
      }

      // Get the user's authentication credentials
      final GoogleSignInAuthentication gAuth = await gAccount.authentication;
      final credential = fb.GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in to Firebase using the Google authentication credentials
      final fUser = await _firebaseAuth
          .signInWithCredential(credential)
          .then((credentials) => credentials.user);

      // Create a user object from the Firebase user
      final user = User(
        uid: fUser!.uid,
        name: fUser.displayName!,
        email: fUser.email!,
        avatar: fUser.photoURL,
        verified: fUser.emailVerified,
      );

      _currentUser.value = user;
      _isAuthenticated.value = true;

      // Save the user object to Firestore and local storage
      await userRef.doc(user.uid).set(user);
      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user.toJson()),
      );

      // Return success
      return right(unit);
    } on fb.FirebaseAuthException catch (_) {
      // Return an error if the user's Google account cannot be accessed
      return left(const AuthError.noGoogleAccount());
    } on PlatformException catch (e) {
      // Return a server error if any other exception occurs
      return left(AuthError.error(e.message));
    }
  }

  Future<Either<AuthError, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = result.user!;

      final snapshot = await userRef.doc(firebaseUser.uid).get();

      final user = snapshot.data;

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user?.toJson()),
      );

      _currentUser.value = user;
      _isAuthenticated.value = true;

      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'wrong-password':
        case 'user-not-found':
          return left(const AuthError.invalidEmailOrPassword());
        default:
          return left(const AuthError.serverError());
      }
    }
  }

  /// Logs the user out by deleting their data from storage and signing them out
  Future<void> logout() async {
    try {
      // Wait for both the storage and authentication operations to complete
      await Future.wait([
        _secureStorageService.deleteAll(),
        _firebaseAuth.signOut(),
      ]);
      _currentUser.value = null;
      _isAuthenticated.value = false;
    } catch (e) {
      // Log any errors that occur during the logout process
      // print('Error logging out: $e');
    }
  }

  Future<Either<AuthError, Unit>> reauthenticate(String password) async {
    try {
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(
        fb.EmailAuthProvider.credential(
          email: _firebaseAuth.currentUser!.email!,
          password: password,
        ),
      );

      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'wrong-password':
        case 'user-not-found':
          return left(const AuthError.error('Invalid credentials provided.'));
        default:
          return left(AuthError.error(e.message));
      }
    }
  }

  Future<Either<AuthError, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = result.user!;

      await _firebaseAuth.currentUser!.updateDisplayName(name);

      final user = User(
        uid: firebaseUser.uid,
        name: name,
        email: email,
        verified: false,
      );

      await userRef.doc(firebaseUser.uid).set(user);

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user.toJson()),
      );

      _currentUser.value = user;
      _isAuthenticated.value = true;

      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else {
        return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> sendPasswordResetEmail() async {
    try {
      // Sends the verification email to the current user's email address
      final email = _firebaseAuth.currentUser!.email!;
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // If the user is not logged in, return an authentication error
      if (e.code == 'user-mismatch') {
        return left(const AuthError.userNotFound());
      } else {
        // Otherwise, return a server error
        return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> sendVerificationEmail() async {
    try {
      // Sends the verification email to the current user's email address
      await _firebaseAuth.currentUser!.sendEmailVerification();
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // If the user is not logged in, return an authentication error
      if (e.code == 'user-mismatch') {
        return left(const AuthError.userNotFound());
      } else {
        // Otherwise, return a server error
        return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> updateEmailAddress(String newEmail) async {
    final curUser = _firebaseAuth.currentUser!;

    try {
      await curUser.updateEmail(newEmail);
      await userRef.doc(curUser.uid).update(email: newEmail);
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else if (e.code == 'requires-recent-login') {
        return left(const AuthError.requiresRecentLogin());
      } else {
        return left(AuthError.error(e.message));
      }
    }
  }

  Future<Either<AuthError, Unit>> updatePassword(String newPassword) async {
    final curUser = _firebaseAuth.currentUser!;

    try {
      await curUser.updatePassword(newPassword);
      return right(unit);
    } on fb.FirebaseAuthException {
      return left(const AuthError.serverError());
    }
  }

  Future<Either<AuthError, Unit>> updateProfile(User u) async {
    final id = _firebaseAuth.currentUser!.uid;

    try {
      userRef.doc(id).set(u);

      final updatedUserSnapshot = await userRef.doc(id).get();
      final updatedUser = updatedUserSnapshot.data;

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(updatedUser?.toJson()),
      );

      _currentUser.value = updatedUser;

      notifyListeners();

      return right(unit);
    } on fb.FirebaseAuthException {
      return left(const AuthError.serverError());
    }
  }
}
