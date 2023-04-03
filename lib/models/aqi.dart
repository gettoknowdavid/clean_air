import 'package:freezed_annotation/freezed_annotation.dart';

import 'attributions.dart';
import 'city.dart';
import 'debug.dart';
import 'forecast.dart';
import 'iaqi.dart';
import 'time.dart';

part 'aqi.freezed.dart';
part 'aqi.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class Aqi with _$Aqi {
  const factory Aqi({
    @JsonKey(name: 'aqi') int? value,
    int? idx,
    List<Attributions>? attributions,
    City? city,
    String? dominentpol,
    IAqi? iaqi,
    Time? time,
    Forecast? forecast,
    Debug? debug,
  }) = _Aqi;

  factory Aqi.fromJson(Map<String, dynamic> json) => _$AqiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AqiToJson(this);
}
