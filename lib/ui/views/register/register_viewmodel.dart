import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/firestore_service.dart';
import 'package:clean_air/services/secure_storage_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/views/register/register_view.form.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  bool get disabled => !isFormValid || !hasName || !hasEmail || !hasPassword;

  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _firestoreService = locator<FirestoreService>();
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      final user = User.fromFirebase(firebaseUser!);
      await _firestoreService.storeUser(user);
      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user.toJson()),
      );

      await _authService.sendEmailVerification();

      _navigationService.clearStackAndShow(Routes.verificationView);
    } on fb.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: kEmailAlreadyInUseErrorMessage,
        );
      } else {
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: kServerErrorMessage,
        );
      }
    }
  }

  void navigateBackToLogin() {
    _navigationService.back();
  }
}
