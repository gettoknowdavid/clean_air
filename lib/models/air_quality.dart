import 'package:freezed_annotation/freezed_annotation.dart';

import 'attributions.dart';
import 'city.dart';
import 'debug.dart';
import 'forecast.dart';
import 'iaqi.dart';
import 'time.dart';

part 'air_quality.freezed.dart';
part 'air_quality.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class AirQuality with _$AirQuality {
  factory AirQuality({
    int? aqi,
    int? idx,
    List<Attributions>? attributions,
    City? city,
    String? dominentpol,
    IAqi? iaqi,
    Time? time,
    Forecast? forecast,
    Debug? debug,
  }) = _AirQuality;

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AirQualityToJson(this);
}
