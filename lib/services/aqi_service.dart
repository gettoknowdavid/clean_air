import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/client/aqi_client.dart';
import 'package:clean_air/core/client/dio_client.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/last_aqi.dart';
import 'package:clean_air/services/objectbox_service.dart';
import 'package:dio/dio.dart';

class AqiService {
  final _client = AqiClient(dioClient());
  final _objectBox = locator<ObjectBoxService>();

  Future<Aqi?> getCurrentLocationAQI() async {
    try {
      final result = await _client.getCurrentLocationAQI();
      final lastAqiBox = _objectBox.store.box<LastAqi>();
      lastAqiBox.put(LastAqi(id: 1, aqi: result.data!.value!));
      return result.data;
    } on DioError {
      return null;
    }
  }

  Future<Aqi?> getAqiByGeo(double lat, double lon) async {
    try {
      final result = await _client.getAqiByGeo(lat, lon);
      return result.data;
    } on DioError {
      return null;
    }
  }
}
