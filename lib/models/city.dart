import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'city.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class City {
  @Id()
  int? id;

  List<double>? geo;

  String? name;

  String? url;

  dynamic location;

  City({
    this.id,
    this.geo,
    this.name,
    this.url,
    this.location,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
