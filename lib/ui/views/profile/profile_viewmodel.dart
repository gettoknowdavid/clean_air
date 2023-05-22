import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/c_air_quality.dart';
import 'package:clean_air/models/condition.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/location_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ProfileViewModel extends ReactiveViewModel with ListenableServiceMixin {
  final _aqiService = locator<AirQualityService>();
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _preferences = locator<SharedPreferencesService>();

  ProfileViewModel() {
    listenToReactiveValues([_localProfileAvatar]);
    getLocalProfileAvatar();
  }

  final _localProfileAvatar = ReactiveValue<Image?>(null);
  Image? get localProfileAvatar => _localProfileAvatar.value;

  NetworkStatus get networkStatus => _networkService.status;
  bool get isConnected => _networkService.status == NetworkStatus.connected;
  User? get user => _authService.currentUser;
  // String? get location => _aqiService.appAQI?.city?.name;
  CAirQuality get conditionedAQI => _aqiService.conditionedAQI;
  String? get location => _locationService.location;

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

  Future<void> navigateToAboutView() async {
    await _navigationService.navigateToAboutView();
  }

  Future<void> navigateToAccountView() async {
    await _navigationService.navigateToAccountView();
  }

  Future<void> navigateToConditionView() async {
    await _navigationService.navigateToNestedConditionViewInLayoutViewRouter(1);
  }

  Future<void> getLocalProfileAvatar() async {
    if (networkStatus == NetworkStatus.disconnected) {
      final result = await _preferences.readImage(kProfileImageKey);
      _localProfileAvatar.value = result;
      notifyListeners();
    }
  }

  ThemeMode? selectedThemeMode(BuildContext context) {
    return getThemeManager(context).selectedThemeMode;
  }

  Future<void> showThemeBottomSheet() async {
    await _bottomSheetService.showCustomSheet(variant: BottomSheetType.theme);
  }

  String getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.light:
        return 'Light Mode';
      default:
        return 'System';
    }
  }

  IconData getIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return PhosphorIcons.regular.moon;
      case ThemeMode.light:
        return PhosphorIcons.regular.sun;
      default:
        return PhosphorIcons.regular.nut;
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _aqiService,
        _locationService,
        _networkService,
      ];

  String get conditionName {
    switch (conditionedAQI.condition) {
      case Condition.asthma:
        return 'Asthma';
      case Condition.hbp:
        return 'High Blood Pressure';
      case Condition.bronchitis:
        return 'Bronchitis';
      case Condition.lungCancer:
        return 'Lung Cancer';
      case Condition.emphysema:
        return 'Emphysema';
      default:
        return 'Set Health Condition';
    }
  }
}
