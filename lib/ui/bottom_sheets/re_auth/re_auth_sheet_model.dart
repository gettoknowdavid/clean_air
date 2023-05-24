import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 're_auth_sheet.form.dart';

class ReAuthSheetModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _snackbarService = locator<SnackbarService>();

  User get currentUser => _authService.currentUser!;

  Future<void> submit() async {
    setBusy(true);
    final result = await _authService.reauthenticate(passwordValue!);

    return result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            error: (value) => value.message ?? '',
            serverError: (_) => kServerErrorMessage,
            invalidEmailOrPassword: (_) => kInvalidEmailPassword,
          ),
        );
      },
      (success) {
        setBusy(false);
        _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
