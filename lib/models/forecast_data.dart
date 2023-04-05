import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_data.freezed.dart';
part 'forecast_data.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class ForecastData with _$ForecastData {
  factory ForecastData({
    int? avg,
    DateTime? day,
    int? max,
    int? min,
  }) = _ForecastData;

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForecastDataToJson(this);
}
