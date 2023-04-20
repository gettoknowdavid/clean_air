import 'package:clean_air/app/app.dialogs.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'login_view.form.dart';

class LoginViewModel extends FormViewModel with ListenableServiceMixin {
  final _aqiService = locator<AirQualityService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  bool get disabled => !isFormValid || !hasEmail || !hasPassword || isBusy;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  NetworkStatus get networkStatus => _networkService.status;

  Future<void> login({required String email, required String password}) async {
    if (networkStatus == NetworkStatus.disconnected) {
      _dialogService.showCustomDialog(variant: DialogType.networkError);
    } else {
      setBusy(true);
      final result = await _authService.login(email: email, password: password);
      return result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              serverError: (_) => kServerErrorMessage,
              invalidEmailOrPassword: (_) => kInvalidEmailPassword,
            ),
          );
        },
        (success) async {
          await _aqiService.getCurrentLocationAQI().then((value) {
            if (value != null) {
              _navigationService.clearStackAndShow(Routes.layoutView);
            } else {
              setBusy(false);
              _snackbarService.showCustomSnackBar(
                duration: const Duration(seconds: 6),
                variant: SnackbarType.error,
                message: kAirQualityErrorMessage,
              );
            }
          });
        },
      );
    }
  }

  void navigateToForgotPasswordView() =>
      _navigationService.navigateToForgotPasswordView();

  void navigateToRegisterView() => _navigationService.navigateToRegisterView();
}
