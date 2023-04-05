import 'package:clean_air/models/daily.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Forecast with _$Forecast {
  factory Forecast({Daily? daily}) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
