import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/c_air_quality.dart';
import 'package:clean_air/models/pollutant.dart';
import 'package:clean_air/models/pollution_level.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel
    with Initialisable, ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _airQualityService = locator<AirQualityService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  AirQuality? get airQuality => _airQualityService.appAQI;
  String get healthImplication => getHealthImplications(airQuality!.aqi!);
  Color get indexColor => getColorLegend(airQuality!.aqi!);
  List<Pollutant> get pollutants => _airQualityService.pollutants;
  PollutionLevel get pollutionLevel => getPollutionLevel(airQuality!.aqi!);
  CAirQuality get conditionAQI => _airQualityService.conditionedAQI;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _airQualityService,
        _authService,
      ];

  User? get user => _authService.currentUser;

  @override
  Future<void> initialise() async {
    await _airQualityService.getCurrentLocationAQI();
  }

  Future<void> logout() async {
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> navigateToDetails() async {
    await _navigationService.navigateToNestedDetailsViewInLayoutViewRouter(
      airQuality: airQuality!,
      routerId: 1,
    );
  }

  Future<void> onTapCityName() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.info,
      title: 'Air Quality Sensor Station',
      description:
          'Showing the nearest air quality sensor station to your current location.',
    );
  }

  Future<void> setHealthCondition() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.condition,
    );
  }

  Color pollutantColor(int index) => getColorLegend(index);
}
