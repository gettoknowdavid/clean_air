import 'dart:async';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/open_mail_app_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerificationViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _openMailAppService = locator<OpenMailAppService>();

  final isVerified = ReactiveValue<bool>(false);

  Timer? timer;

  bool get isAuthenticated => _authService.isAuthenticated;

  bool get isEmailVerified => true;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> cancel() => Future.wait([_authService.logout()]);

  Future<void> checkEmailVerified() async {
    final result = await _authService.checkEmailVerified();
    result.fold(
      () => _navigationService.clearStackAndShow(Routes.loginView),
      (either) => null,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void goHome() => _navigationService.clearStackAndShow(Routes.layoutView);

  @override
  Future<void> initialise() async {
    if (isEmailVerified == false) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        await checkEmailVerified();
      });
    }
  }

  Future<void> openMailApp() async {
    await _openMailAppService.openMailApp();
  }

  Future<void> sendVerification() async {
    final result = await _authService.sendVerificationEmail();

    result.fold(
      (failure) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            userNotFound: (_) => kNoUserFoundErrorMessage,
          ),
        );
      },
      (success) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.success,
          message: kVerificationEmailSentSuccess,
        );
      },
    );
  }
}
