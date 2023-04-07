import 'package:freezed_annotation/freezed_annotation.dart';

part 'pollutant.freezed.dart';
part 'pollutant.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Pollutant with _$Pollutant {
  factory Pollutant({num? v, String? name}) = _Pollutant;

  factory Pollutant.fromJson(Map<String, dynamic> json) =>
      _$PollutantFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PollutantToJson(this);
}
