import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'pollutant.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class Pollutant {
  @Id()
  int? id;

  num? v;

  Pollutant({this.id, this.v});

  factory Pollutant.fromJson(Map<String, dynamic> json) =>
      _$PollutantFromJson(json);

  Map<String, dynamic> toJson() => _$PollutantToJson(this);
}
