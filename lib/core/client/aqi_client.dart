import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/aqi_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'aqi_client.g.dart';

@RestApi()
abstract class AqiClient {
  factory AqiClient(Dio dio, {String baseUrl}) = _AqiClient;

  @GET('/here/')
  Future<AqiResponse<Aqi?>> getCurrentLocationAQI();

  @GET('/geo:{lat};{lon}/')
  Future<AqiResponse<Aqi?>> getAqiByGeo(
    @Path('lat') num lat,
    @Path('lon') num lon,
  );
}
