import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/client/air_quality_client.dart';
import 'package:clean_air/core/client/dio_client.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';

class AqiService {
  final _client = AirQualityClient(dioClient());
  final _preferences = locator<SharedPreferencesService>();

  Future<AirQuality?> getAqiByGeo(double lat, double lon) async {
    try {
      final result = await _client.getAqiByGeo(lat, lon);
      return result.data;
    } on DioError {
      return null;
    }
  }

  Future<AirQuality?> getCurrentLocationAQI() async {
    try {
      final result = await _client.getCurrentLocationAQI();
      _preferences.write(key: kLastAQIKey, value: result.data?.toJson());
      return result.data;
    } on DioError {
      return null;
    }
  }
}
