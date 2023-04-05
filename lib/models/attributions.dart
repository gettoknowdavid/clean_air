import 'package:freezed_annotation/freezed_annotation.dart';

part 'attributions.freezed.dart';
part 'attributions.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Attributions with _$Attributions {
  factory Attributions({
    String? url,
    String? name,
    String? logo,
  }) = _Attributions;

  factory Attributions.fromJson(Map<String, dynamic> json) =>
      _$AttributionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AttributionsToJson(this);
}
