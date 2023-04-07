import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/firestore_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/open_mail_app_service.dart';
import 'package:clean_air/services/secure_storage_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:clean_air/ui/common/app_theme.dart';
import 'package:clean_air/ui/dialogs/error/error_dialog.dart';
import 'package:clean_air/ui/dialogs/mail_app/mail_app_dialog.dart';
import 'package:clean_air/ui/dialogs/network_error/network_error_dialog.dart';
import 'package:clean_air/ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import 'package:clean_air/ui/layout/layout_view.dart';
import 'package:clean_air/ui/views/favourites/favourites_view.dart';
import 'package:clean_air/ui/views/forgot_password/forgot_password_view.dart';
import 'package:clean_air/ui/views/home/home_view.dart';
import 'package:clean_air/ui/views/login/login_view.dart';
import 'package:clean_air/ui/views/onboarding/onboarding_view.dart';
import 'package:clean_air/ui/views/password_reset_confirmation/password_reset_confirmation_view.dart';
import 'package:clean_air/ui/views/profile/profile_view.dart';
import 'package:clean_air/ui/views/register/register_view.dart';
import 'package:clean_air/ui/views/search/search_view.dart';
import 'package:clean_air/ui/views/startup/startup_view.dart';
import 'package:clean_air/ui/views/verification/verification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: OnboardingView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: VerificationView),
    MaterialRoute(page: LayoutView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: FavouritesView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: PasswordResetConfirmationView),
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
    LazySingleton(classType: OpenMailAppService),
    LazySingleton(classType: AirQualityService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: ErrorDialog),
    StackedDialog(classType: NetworkErrorDialog),
    StackedDialog(classType: NoMailAppDialog),
    StackedDialog(classType: MailAppDialog),
// @stacked-dialog
  ],
)
class CleanAirApp extends StatelessWidget {
  const CleanAirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'CleanAir',
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        );
      },
    );
  }
}
