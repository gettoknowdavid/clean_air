import 'package:clean_air/app/app.dialogs.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountViewModel extends ReactiveViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  NetworkStatus get networkStatus => _networkService.status;
  User? get user => _authService.currentUser;

  Future<void> sendResetPasswordEmail() async {
    if (networkStatus == NetworkStatus.disconnected) {
      _dialogService.showCustomDialog(variant: DialogType.networkError);
    } else {
      setBusy(true);
      final response = await _authService.sendPasswordResetEmail();
      return response.fold(
        (failure) {
          setBusy(false);
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
        (success) {},
      );
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _networkService,
      ];
}
