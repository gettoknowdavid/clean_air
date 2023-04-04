import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'debug.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class Debug {
  @Id()
  int? id;

  @JsonKey(name: 'sync')
  DateTime? syncValue;

  Debug({this.id, this.syncValue});

  factory Debug.fromJson(Map<String, dynamic> json) => _$DebugFromJson(json);

  Map<String, dynamic> toJson() => _$DebugToJson(this);
}
