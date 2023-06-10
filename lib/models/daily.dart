import 'package:clean_air/models/forecast_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily.freezed.dart';
part 'daily.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Daily with _$Daily {
  factory Daily({
    List<ForecastData>? o3,
    List<ForecastData>? pm10,
    List<ForecastData>? pm25,
    List<ForecastData>? co,
    List<ForecastData>? no2,
    List<ForecastData>? so2,
  }) = _Daily;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DailyToJson(this);

  factory Daily.none() {
    return Daily(
      co: null,
      no2: null,
      o3: null,
      pm10: null,
      pm25: null,
      so2: null,
    );
  }
}
