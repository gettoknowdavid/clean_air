import 'package:freezed_annotation/freezed_annotation.dart';

part 'init.freezed.dart';
part 'init.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Init with _$Init {
  factory Init({
    int? isInitialStartUp,
    int? isInitialLogin,
  }) = _Init;

  factory Init.fromJson(Map<String, dynamic> json) => _$InitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InitToJson(this);
}
