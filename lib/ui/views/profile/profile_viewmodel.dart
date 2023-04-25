import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  User? get user => _authService.currentUser;

  Future<void> logout() async {
    setBusy(true);
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> showEditProfileBottomSheet() async {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.editProfile,
      isScrollControlled: true,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
