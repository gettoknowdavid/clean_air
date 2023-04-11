import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)
class City with _$City {
  factory City({
    List<double>? geo,
    String? name,
    String? url,
    dynamic location,
    String? formattedName,
    String? country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
