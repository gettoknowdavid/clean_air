import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/services/objectbox_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    if (await locator<ObjectBoxService>().isInitialStartup()) {
      FlutterNativeSplash.remove();
      _navigationService.replaceWithOnboardingView();
    } else {
      FlutterNativeSplash.remove();
      _navigationService.replaceWithLoginView();
    }
  }
}
