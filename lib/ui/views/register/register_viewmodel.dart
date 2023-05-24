import 'package:clean_air/app/app.dialogs.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/common/password_rules.dart';
import 'package:clean_air/ui/views/register/register_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordState {
  List<Map> rules;
  bool visible;
  Color color;

  PasswordState(this.rules, this.visible, this.color);
}

class RegisterViewModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();

  final _dialogService = locator<DialogService>();

  final _networkService = locator<NetworkService>();

  final _snackbarService = locator<SnackbarService>();

  final _navigationService = locator<NavigationService>();

  final _rules = ReactiveValue<List<Map>>(passwordRules);

  final _rulesVisibility = ReactiveValue<bool>(false);

  final _ruleColor = ReactiveValue<Color>(Colors.grey);

  RegisterViewModel() {
    listenToReactiveValues([_rules, _rulesVisibility, _ruleColor]);
  }
  bool get disabled =>
      !isFormValid || !hasName || !hasEmail || !hasPassword || isBusy;
  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  NetworkStatus get networkStatus => _networkService.status;
  List<Map> get rules => _rules.value;
  Color get rulesColor => _ruleColor.value;

  bool get rulesVisibility => _rulesVisibility.value;

  void navigateBack() => _navigationService.back();

  void navigateBackToLoginView() => _navigationService.navigateToLoginView();
  void next() => _navigationService.navigateToVerificationView();

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (networkStatus == NetworkStatus.disconnected) {
      _dialogService.showCustomDialog(variant: DialogType.networkError);
    } else {
      setBusy(true);
      final result = await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              serverError: (_) => kServerErrorMessage,
              emailInUse: (_) => kEmailAlreadyInUseErrorMessage,
            ),
          );
        },
        (_) async {
          await _authService.sendVerificationEmail();
          await _navigationService.clearStackAndShow(Routes.verificationView);
        },
      );
    }
  }
}
