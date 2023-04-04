import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'attributions.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class Attributions {
  @Id()
  int? id;

  String? url;

  String? name;

  String? logo;

  Attributions({
    this.id,
    this.url,
    this.name,
    this.logo,
  });

  factory Attributions.fromJson(Map<String, dynamic> json) =>
      _$AttributionsFromJson(json);

  Map<String, dynamic> toJson() => _$AttributionsToJson(this);
}
