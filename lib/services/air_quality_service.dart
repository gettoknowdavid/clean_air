import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/client/air_quality_client.dart';
import 'package:clean_air/core/client/dio_client.dart';
import 'package:clean_air/core/helpers/get_color_legend.dart';
import 'package:clean_air/core/helpers/get_health_implications.dart';
import 'package:clean_air/core/helpers/get_pollution_level.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/pollutant.dart';
import 'package:clean_air/models/pollution_level.dart';
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
  final _pollutionLevel = ReactiveValue<PollutionLevel>(PollutionLevel.good);
  final _allPollutants = ReactiveValue<List<Pollutant>>([]);
  final _healthImplication = ReactiveValue<String>('');

  AirQualityService() {
    listenToReactiveValues([
      _allPollutants,
      _appAQI,
      _indexColor,
      _pollutionLevel,
      _healthImplication,
    ]);

    if (_preferences.hasKey(kLastAQIKey) &&
        _networkService.status == NetworkStatus.disconnected) {
      // ...
    }
  }

  AirQuality? get appAQI => _appAQI.value;
  Color get indexColor => _indexColor.value;
  List<Pollutant> get pollutants => _allPollutants.value;
  PollutionLevel get pollutionLevel => _pollutionLevel.value;
  String get healthImplication => _healthImplication.value;

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
      final result = AirQuality.fromJson(jsonDecode(valueString));
      _appAQI.value = result;
      _indexColor.value = getColorLegend(result.aqi!);
      _pollutionLevel.value = getPollutionLevel(result.aqi!);
      return result;
    }

    try {
      final result = await _client.getCurrentLocationAQI();
      final valueString = jsonEncode(result.data?.toJson());
      await _preferences.write(key: kLastAQIKey, value: valueString);
      _appAQI.value = result.data;
      _indexColor.value = getColorLegend(result.data!.aqi!);
      _pollutionLevel.value = getPollutionLevel(result.data!.aqi!);
      _healthImplication.value = getHealthImplications(result.data!.aqi!);
      return result.data;
    } on DioError {
      return null;
    }
  }
}

// if (_preferences.hasKey(kLastAQIKey)) {
//       final valueString = _preferences.read(kLastAQIKey);
//       final lastAqiModel = AirQuality.fromJson(jsonDecode(valueString));
//       _appAQI.value = lastAqiModel;
//       _indexColor.value = getColorLegend(_appAQI.value!.aqi!);
//       _pollutionLevel.value = getPollutionLevel(_appAQI.value!.aqi!);
//     }
