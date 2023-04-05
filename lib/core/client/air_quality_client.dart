import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/aqi_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'air_quality_client.g.dart';

@RestApi()
abstract class AirQualityClient {
  factory AirQualityClient(Dio dio, {String baseUrl}) = _AirQualityClient;

  @GET('/here/')
  Future<AqiResponse<AirQuality?>> getCurrentLocationAQI();

  @GET('/geo:{lat};{lon}/')
  Future<AqiResponse<AirQuality?>> getAqiByGeo(
    @Path('lat') num lat,
    @Path('lon') num lon,
  );
}
