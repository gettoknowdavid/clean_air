import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'AQI_BASE_URL')
  static final String aqiBaseUrl = _Env.aqiBaseUrl;

  @EnviedField(varName: 'AQI_TOKEN')
  static final String aqiToken = _Env.aqiToken;
}
