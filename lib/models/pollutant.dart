import 'package:freezed_annotation/freezed_annotation.dart';

part 'pollutant.freezed.dart';
part 'pollutant.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class Pollutant with _$Pollutant {
  const factory Pollutant({num? v}) = _Pollutant;

  factory Pollutant.fromJson(Map<String, dynamic> json) =>
      _$PollutantFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PollutantToJson(this);
}
