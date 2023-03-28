import 'package:clean_air/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:stacked/stacked.dart';

class AuthService with ListenableServiceMixin {
  AuthService() {
    listenToReactiveValues([_isAuthenticated, _isEmailVerified]);
  }

  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  final _isAuthenticated = ReactiveValue<bool>(false);
  bool get isAuthenticated => _isAuthenticated.value;

  final _isEmailVerified = ReactiveValue<bool>(false);
  bool get isEmailVerified => _isEmailVerified.value;

  Future<bool?> checkEmailVerified() async {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    await firebaseUser.reload();

    if (firebaseUser.emailVerified) {
      _isEmailVerified.value = true;
      return true;
    } else {
      _isEmailVerified.value = false;
      return false;
    }
  }

  Future<User?> currentUser() async {
    final fb.User? firebseUser = _firebaseAuth.currentUser;

    if (firebseUser == null) {
      _isAuthenticated.value = false;
      return null;
    }

    _isAuthenticated.value = true;

    final user = (await userRef.doc(firebseUser.uid).get()).data;

    return user;
  }

  Future<fb.User?> login({
    required String email,
    required String password,
  }) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    _isAuthenticated.value = true;

    return result.user;
  }

  Future<fb.User?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firebaseAuth.currentUser!.updateDisplayName(name);

    return result.user;
  }

  Future<void> sendEmailVerification() async {
    if (_firebaseAuth.currentUser != null) {
      return _firebaseAuth.currentUser!.sendEmailVerification();
    }
  }

  Future<void> logout() => Future.wait([_firebaseAuth.signOut()]);
}
