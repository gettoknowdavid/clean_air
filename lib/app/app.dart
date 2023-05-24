import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/favourites_service.dart';
import 'package:clean_air/services/firestore_service.dart';
import 'package:clean_air/services/location_service.dart';
import 'package:clean_air/services/media_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/open_mail_app_service.dart';
import 'package:clean_air/services/secure_storage_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:clean_air/ui/bottom_sheets/condition/condition_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/edit_profile/edit_profile_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/image_source/image_source_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/info/info_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/re_auth/re_auth_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/reset_password/reset_password_sheet.dart';
import 'package:clean_air/ui/bottom_sheets/theme/theme_sheet.dart';
import 'package:clean_air/ui/common/app_theme.dart';
import 'package:clean_air/ui/dialogs/mail_app/mail_app_dialog.dart';
import 'package:clean_air/ui/dialogs/network_error/network_error_dialog.dart';
import 'package:clean_air/ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import 'package:clean_air/ui/layout/layout_view.dart';
import 'package:clean_air/ui/views/about/about_view.dart';
import 'package:clean_air/ui/views/account/account_view.dart';
import 'package:clean_air/ui/views/condition/condition_view.dart';
import 'package:clean_air/ui/views/details/details_view.dart';
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
import 'package:stacked_themes/stacked_themes.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: OnboardingView, initial: true),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: VerificationView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: PasswordResetConfirmationView),
    MaterialRoute(
      page: LayoutView,
      maintainState: true,
      children: [
        MaterialRoute(page: HomeView),
        MaterialRoute(page: DetailsView),
        MaterialRoute(page: SearchView),
        MaterialRoute(page: FavouritesView),
        MaterialRoute(page: ProfileView),
        MaterialRoute(page: ConditionView),
      ],
    ),
    MaterialRoute(page: AboutView),
    MaterialRoute(page: AccountView),
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
    LazySingleton(classType: FavouritesService),
    LazySingleton(classType: MediaService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
    LazySingleton(classType: LocationService),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: NetworkErrorDialog),
    StackedDialog(classType: NoMailAppDialog),
    StackedDialog(classType: MailAppDialog),
// @stacked-dialog
  ],
  bottomsheets: [
    StackedBottomsheet(classType: ImageSourceSheet),
    StackedBottomsheet(classType: EditProfileSheet),
    StackedBottomsheet(classType: ResetPasswordSheet),
    StackedBottomsheet(classType: PasswordConfirmationSheet),
    StackedBottomsheet(classType: ConditionSheet),
    StackedBottomsheet(classType: InfoSheet),
    StackedBottomsheet(classType: ThemeSheet),
    StackedBottomsheet(classType: ReAuthSheet),
// @stacked-bottom-sheets
  ],
)
class CleanAirApp extends StatefulWidget {
  const CleanAirApp({super.key});

  @override
  State<CleanAirApp> createState() => _CleanAirAppState();
}

class _CleanAirAppState extends State<CleanAirApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ThemeBuilder(
          lightTheme: lightTheme,
          darkTheme: darkTheme,
          builder: (context, regularTheme, darkTheme, themeMode) {
            return MaterialApp(
              title: 'CleanAir',
              theme: regularTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [StackedService.routeObserver],
            );
          },
        );
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final _networkService = locator<NetworkService>();

    switch (state) {
      case AppLifecycleState.resumed:
        _networkService.onResume();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        _networkService.onPause();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
}
