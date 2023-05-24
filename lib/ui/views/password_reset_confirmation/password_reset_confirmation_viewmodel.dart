import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordResetConfirmationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> navigateBackToLoginView() async {
    await _navigationService.clearStackAndShow(Routes.loginView);
  }
}
