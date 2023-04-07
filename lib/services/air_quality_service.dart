import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/client/air_quality_client.dart';
import 'package:clean_air/core/client/dio_client.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/pollutant.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:clean_air/ui/common/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AirQualityService with ListenableServiceMixin {
  final _client = AirQualityClient(dioClient());

  final _networkService = locator<NetworkService>();
  final _preferences = locator<SharedPreferencesService>();
  final _appAQI = ReactiveValue<AirQuality?>(null);

  final _indexColor = ReactiveValue<Color>(kGreen);
  final _allPollutants = ReactiveValue<List<Pollutant>>([]);

  AirQualityService() {
    listenToReactiveValues([_allPollutants, _appAQI, _indexColor]);
    if (_preferences.hasKey(kLastAQIKey)) {
      final valueString = _preferences.read(kLastAQIKey);
      final lastAqiModel = AirQuality.fromJson(jsonDecode(valueString));
      _appAQI.value = lastAqiModel;
      _indexColor.value = getIndexColor(_appAQI.value!.aqi!);
    }
  }
  AirQuality? get appAQI => _appAQI.value;

  Color get indexColor => _indexColor.value;
  List<Pollutant> get pollutants => _allPollutants.value;

  Future<AirQuality?> getAqiByGeo(double lat, double lon) async {
    try {
      final result = await _client.getAqiByGeo(lat, lon);

      return result.data;
    } on DioError {
      return null;
    }
  }

  Future<AirQuality?> getCurrentLocationAQI() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      final valueString = _preferences.read(kLastAQIKey);
      return AirQuality.fromJson(jsonDecode(valueString));
    }

    try {
      final result = await _client.getCurrentLocationAQI();
      final valueString = jsonEncode(result.data?.toJson());
      await _preferences.write(key: kLastAQIKey, value: valueString);
      _appAQI.value = result.data;
      _indexColor.value = getIndexColor(_appAQI.value!.aqi!);
      return result.data;
    } on DioError {
      return null;
    }
  }

  Color getIndexColor(int index) {
    switch (index ~/ 50) {
      case 0:
        return kGreen;
      case 1:
        return kYellow;
      case 2:
        return kOrange;
      case 3:
        return kRed;
      case 4:
      case 5:
        return kPurple;
      default:
        return kMaroon;
    }
  }
}
