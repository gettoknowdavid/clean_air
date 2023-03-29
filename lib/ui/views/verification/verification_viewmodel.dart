import 'dart:async';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/open_mail_app_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerificationViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _openMailAppService = locator<OpenMailAppService>();

  Timer? timer;

  bool get isAuthenticated => _authService.isAuthenticated;

  bool get isEmailVerified => _authService.isEmailVerified;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> checkEmailVerified() async {
    final result = await _authService.checkEmailVerified();

    if (result == null) {
      _navigationService.clearStackAndShow(Routes.loginView);
    }

    if (result == true) {
      timer?.cancel();
      _navigationService.clearStackAndShow(Routes.layoutView);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Future<void> initialise() async {
    if (!isEmailVerified) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  Future<void> openMailApp() async {
    await _openMailAppService.openMailApp();
  }

  Future<void> cancel() => Future.wait([_authService.logout()]);

  Future<void> sendVerification() async {
    try {
      // Sends the verification email to the current user's email address
      await _authService.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      // If the user is not logged in, return an authentication error
      if (e.code == 'user-mismatch') {
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: kNoUserFoundErrorMessage,
        );
      } else {
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: kServerErrorMessage,
        );
      }
    }
  }
}
