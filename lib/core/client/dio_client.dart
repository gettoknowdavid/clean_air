import 'package:clean_air/core/env/env.dart';
import 'package:dio/dio.dart';

Dio dioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: Env.aqiBaseUrl,
      queryParameters: {'token': Env.aqiToken},
    );

  dio.interceptors.addAll([
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),
  ]);

  return dio;
}
