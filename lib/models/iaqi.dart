import 'package:clean_air/models/pollutant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'iaqi.freezed.dart';
part 'iaqi.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class IAqi with _$IAqi {
  factory IAqi({
    Pollutant? dew, // Dew
    Pollutant? h, // Humidity
    Pollutant? p, // Pressure
    Pollutant? pm25, // PM2.5
    Pollutant? t, // Temperature
    Pollutant? w, // Wind
  }) = _IAqi;

  factory IAqi.fromJson(Map<String, dynamic> json) => _$IAqiFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$IAqiToJson(this);
}
