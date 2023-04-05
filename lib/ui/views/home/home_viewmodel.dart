import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<AirQuality?>
    with ListenableServiceMixin {
  final _aqiService = locator<AqiService>();

  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();
  final _airQuality = ReactiveValue<AirQuality?>(null);

  HomeViewModel() {
    listenToReactiveValues([_airQuality]);
  }
  AirQuality? get airQuality => _airQuality.value;

  @override
  Future<void> onData(AirQuality? data) async {
    final valueString = await _preferences.read(kLastAQIKey);
    final lastAqiValue = AirQuality.fromJson(jsonDecode(valueString)).aqi;

    if (data?.aqi == lastAqiValue) {
      return;
    } else {
      super.onData(data);
    }
  }

  @override
  Future<AirQuality?> futureToRun() async {
    final theNewAqiModel = await _aqiService.getCurrentLocationAQI();
    final theNewAqiValue = theNewAqiModel?.aqi;

    final valueString = await _preferences.read(kLastAQIKey);
    final lastAqiValue = AirQuality.fromJson(jsonDecode(valueString)).aqi;

    if (_airQuality.value == null) {
      _airQuality.value = theNewAqiModel;
      return theNewAqiModel;
    }

    if (theNewAqiValue == lastAqiValue) {
      return _airQuality.value;
    } else {
      _airQuality.value = theNewAqiModel;
      return theNewAqiModel;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
