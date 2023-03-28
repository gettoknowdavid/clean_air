import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/firestore_service.dart';
import 'package:clean_air/services/secure_storage_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/views/login/login_view.form.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  bool get disabled => !isFormValid || !hasEmail || !hasPassword || isBusy;

  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _firestoreService = locator<FirestoreService>();
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();

  void navigateToRegisterView() {
    _navigationService.navigateTo(Routes.registerView);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await _authService.login(
        email: email,
        password: password,
      );

      final user = await _firestoreService.getUser(firebaseUser!.uid);

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user?.toJson()),
      );

      if (firebaseUser.emailVerified) {
        _navigationService.clearStackAndShow(Routes.homeView);
      } else {
        _navigationService.clearStackAndShow(Routes.verificationView);
      }
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'wrong-password':
        case 'user-not-found':
          _snackbarService.showCustomSnackBar(
            variant: SnackbarType.error,
            message: kIncorrectEmailPassword,
          );
          break;
        default:
          _snackbarService.showCustomSnackBar(
            variant: SnackbarType.error,
            message: kServerErrorMessage,
          );
          break;
      }
    }
  }
}
