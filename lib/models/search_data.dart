import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'time.dart';

part 'search_data.freezed.dart';
part 'search_data.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class SearchData with _$SearchData {
  factory SearchData({
    dynamic aqi,
    int? idx,
    City? station,
    Time? time,
  }) = _SearchData;

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}
