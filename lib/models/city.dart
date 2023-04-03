import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class City with _$City {
  const factory City({
    List<double>? geo,
    String? name,
    String? url,
    dynamic location,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
