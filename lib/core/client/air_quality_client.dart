import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/aqi_response.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'air_quality_client.g.dart';

@RestApi()
abstract class AirQualityClient {
  factory AirQualityClient(Dio dio, {String baseUrl}) = _AirQualityClient;

  @GET('/feed/geo:{lat};{lon}/')
  Future<AqiResponse<AirQuality?>> getAqiByGeo(
    @Path('lat') num lat,
    @Path('lon') num lon,
  );

  @GET('/feed/here/')
  Future<AqiResponse<AirQuality?>> getCurrentLocationAQI();

  @GET('/search/?')
  Future<AqiResponse<List<SearchData?>>> searchByName(
    @Query('keyword') String keyword,
  );
}
