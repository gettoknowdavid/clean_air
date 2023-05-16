import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/ui/bottom_sheets/password_confirmation/password_confirmation_sheet.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordConfirmationSheetModel extends FormViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();

  User get currentUser => _authService.currentUser!;

  Future<void> submit() async {
    setBusy(true);
    final result = await _authService.login(
      email: currentUser.email,
      password: passwordValue!,
    );

    return result.fold(
      (l) {
        setBusy(false);
        _bottomSheetService.completeSheet(SheetResponse(confirmed: false));
      },
      (r) {
        setBusy(false);
        _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
