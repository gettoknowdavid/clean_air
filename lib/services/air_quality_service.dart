import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/client/air_quality_client.dart';
import 'package:clean_air/core/client/dio_client.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/c_air_quality.dart';
import 'package:clean_air/models/condition.dart';
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
  final _searchResult = ReactiveValue<List<SearchData?>>([]);
  final _allPollutants = ReactiveValue<List<Pollutant>>([]);
  final _conditionedAQI = ReactiveValue<CAirQuality>(CAirQuality.none());

  AirQualityService() {
    listenToReactiveValues([_allPollutants, _appAQI, _conditionedAQI]);

    if (_preferences.hasKey(kLastAQIKey) &&
        _networkService.status == NetworkStatus.disconnected) {
      // ...
    }

    // persistResult();
  }

  AirQuality? get appAQI => _appAQI.value;
  List<Pollutant> get pollutants => _allPollutants.value;
  CAirQuality get conditionedAQI => _conditionedAQI.value;
  List<SearchData?> get searchResult => _searchResult.value;

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
      final response = await _client.searchByName(keyword);
      final result = response.data?.where((e) => e?.aqi != '-').toList();
      if (result == null) {
        _searchResult.value = [];
        notifyListeners();
        return [];
      } else {
        _searchResult.value = result;
        notifyListeners();
        // final strgs = result.map((e) => jsonEncode(e!.toJson())).toList();
        // await _preferences.writeList(key: kSearchResultKey, value: strgs);

        return result;
      }
    } on DioError {
      return [];
    }
  }

  Future<void> persistResult() async {
    await _preferences.delete(kSearchResultKey);
    // if (_preferences.hasKey(kSearchResultKey)) {
    //   List<String> list = _preferences.readList(kSearchResultKey);
    //   _searchResult.value =
    //       list.map((e) => SearchData.fromJson(jsonDecode(e))).toList();
    //   notifyListeners();
    // }
  }

  Future<CAirQuality?> getConditionedAQI() async {
    if (_preferences.hasKey(kLastCAQIKey)) {
      final valueString = _preferences.read(kLastCAQIKey);
      final result = CAirQuality.fromJson(jsonDecode(valueString));
      _conditionedAQI.value = result;
      return result;
    } else {
      return CAirQuality.none();
    }
  }

  Future<void> updateConditionedAQI(Condition con, [String? domPol]) async {
    final message = tailoredMessage(domPol, con);
    _conditionedAQI.value = CAirQuality(
      condition: con,
      dominantPollutant: domPol,
      message: message,
    );
    final valueString = jsonEncode(_conditionedAQI.value.toJson());
    await _preferences.write(key: kLastCAQIKey, value: valueString);
    notifyListeners();
  }
}
