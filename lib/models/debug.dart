import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug.freezed.dart';
part 'debug.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  explicitToJson: true,
)
class Debug with _$Debug {
  const factory Debug({@JsonKey(name: 'sync') DateTime? syncValue}) = _Debug;

  factory Debug.fromJson(Map<String, dynamic> json) => _$DebugFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DebugToJson(this);
}
