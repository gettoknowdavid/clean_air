import 'package:clean_air/models/forecast_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily.freezed.dart';
part 'daily.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class Daily with _$Daily {
  const factory Daily({
    List<ForecastData>? o3,
    List<ForecastData>? pm10,
    List<ForecastData>? pm25,
  }) = _Daily;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
