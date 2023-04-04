import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'forecast_data.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class ForecastData {
  @Id()
  int? id;

  int? avg;

  @Property(type: PropertyType.date)
  DateTime? day;

  int? max;

  int? min;

  ForecastData({
    this.id,
    this.avg,
    this.day,
    this.max,
    this.min,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDataToJson(this);
}
