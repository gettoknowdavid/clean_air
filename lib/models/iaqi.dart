import 'package:clean_air/models/pollutant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'iaqi.freezed.dart';
part 'iaqi.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class IAqi with _$IAqi {
  const factory IAqi({
    Pollutant? dew,
    Pollutant? h,
    Pollutant? p,
    Pollutant? pm25,
    Pollutant? t,
    Pollutant? w,
  }) = _IAqi;

  factory IAqi.fromJson(Map<String, dynamic> json) => _$IAqiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IAqiToJson(this);
}
