import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'time.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class Time {
  @Id()
  int? id;

  @Property(type: PropertyType.date)
  DateTime? s;

  String? tz;

  int? v;

  @Property(type: PropertyType.date)
  DateTime? iso;

  Time({
    this.id,
    this.s,
    this.tz,
    this.v,
    this.iso,
  });

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
