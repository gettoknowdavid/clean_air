import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/client/air_quality_client.dart';
import 'package:clean_air/core/client/dio_client.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/pollutant.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

class AirQualityService with ListenableServiceMixin {
  final _client = AirQualityClient(dioClient());

  final _networkService = locator<NetworkService>();
  final _preferences = locator<SharedPreferencesService>();
  final _appAQI = ReactiveValue<AirQuality?>(null);
  final _allPollutants = ReactiveValue<List<Pollutant>>([]);

  AirQualityService() {
    listenToReactiveValues([_allPollutants, _appAQI]);

    if (_preferences.hasKey(kLastAQIKey) &&
        _networkService.status == NetworkStatus.disconnected) {
      // ...
    }
  }

  AirQuality? get appAQI => _appAQI.value;
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
      final result = AirQuality.fromJson(jsonDecode(valueString));
      _appAQI.value = result;
      return result;
    }

    try {
      final result = await _client.getCurrentLocationAQI();
      final valueString = jsonEncode(result.data?.toJson());
      await _preferences.write(key: kLastAQIKey, value: valueString);
      _appAQI.value = result.data;
      return result.data;
    } on DioError {
      return null;
    }
  }

  Future<List<SearchData?>> searchByName(String keyword) async {
    try {
      final result = await _client.searchByName(keyword);
      if (result.data == null) {
        return [];
      } else {
        return result.data!;
      }
    } on DioError {
      return [];
    }
  }
}
