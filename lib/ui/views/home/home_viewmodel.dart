import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/pollutant.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _airQualityService = locator<AirQualityService>();
  final _navigationService = locator<NavigationService>();

  AirQuality? get airQuality => _airQualityService.appAQI;
  Color get indexColor => _airQualityService.indexColor;
  User? get user => _authService.currentUser;
  List<Pollutant> get pollutants => _airQualityService.pollutants;

  Color pollutantColor(int index) => _airQualityService.getIndexColor(index);

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _airQualityService,
        _authService,
      ];

  @override
  Future<void> initialise() async {
    await _airQualityService.getCurrentLocationAQI();
  }

  Future<void> logout() async {
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
