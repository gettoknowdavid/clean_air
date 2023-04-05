import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';
part 'time.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Time with _$Time {
  factory Time({
    DateTime? s,
    String? tz,
    int? v,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
