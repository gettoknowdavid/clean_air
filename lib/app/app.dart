import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/firestore_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/objectbox_service.dart';
import 'package:clean_air/services/secure_storage_service.dart';
import 'package:clean_air/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:clean_air/ui/common/app_theme.dart';
import 'package:clean_air/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:clean_air/ui/views/home/home_view.dart';
import 'package:clean_air/ui/views/login/login_view.dart';
import 'package:clean_air/ui/views/onboarding/onboarding_view.dart';
import 'package:clean_air/ui/views/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: OnboardingView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: SecureStorageService),
    Presolve(
      classType: ObjectBoxService,
      presolveUsing: ObjectBoxService.create,
    ),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class CleanAirApp extends StatelessWidget {
  const CleanAirApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
