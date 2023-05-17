import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_air_quality.freezed.dart';
part 'c_air_quality.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)

/// Conditioned Air Quality model
class CAirQuality with _$CAirQuality {
  factory CAirQuality({
    required Condition condition,
    String? dominantPollutant,
    String? message,
  }) = _CAirQuality;

  factory CAirQuality.fromJson(Map<String, dynamic> json) =>
      _$CAirQualityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CAirQualityToJson(this);

  factory CAirQuality.none() {
    return CAirQuality(
      condition: Condition.none,
      dominantPollutant: null,
      message: tailoredMessage(null, Condition.none),
    );
  }
}
