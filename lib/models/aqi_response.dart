import 'package:clean_air/models/aqi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_response.freezed.dart';
part 'aqi_response.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class AqiResponse with _$AqiResponse {
  const factory AqiResponse({
    String? status,
    Aqi? data,
  }) = _AqiResponse;

  factory AqiResponse.fromJson(Map<String, dynamic> json) =>
      _$AqiResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AqiResponseToJson(this);
}
