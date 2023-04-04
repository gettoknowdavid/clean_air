import 'package:clean_air/models/forecast_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'daily.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class Daily {
  @Id()
  int? id;

  @Transient()
  List<ForecastData>? o3;

  @Transient()
  List<ForecastData>? pm10;

  @Transient()
  List<ForecastData>? pm25;

  Daily({
    this.id,
    this.o3,
    this.pm10,
    this.pm25,
  });

  List<ForecastData>? get dbO3 {
    return o3
        ?.map((e) => ForecastData(
            id: e.id, avg: e.avg, day: e.day, max: e.max, min: e.min))
        .toList();
  }

  set dbO3(List<ForecastData>? value) {
    if (value == null) {
      value = null;
    } else {
      o3 = value
          .map((e) => ForecastData(
              id: e.id, avg: e.avg, day: e.day, max: e.max, min: e.min))
          .toList();
    }
  }

  List<ForecastData>? get dbPm10 {
    return pm10
        ?.map((e) => ForecastData(
            id: e.id, avg: e.avg, day: e.day, max: e.max, min: e.min))
        .toList();
  }

  set dbPm10(List<ForecastData>? value) {
    if (value == null) {
      value = null;
    } else {
      pm10 = value
          .map((e) => ForecastData(
              id: e.id, avg: e.avg, day: e.day, max: e.max, min: e.min))
          .toList();
    }
  }

  List<ForecastData>? get dbPm25 {
    return pm25
        ?.map((e) => ForecastData(
            id: e.id, avg: e.avg, day: e.day, max: e.max, min: e.min))
        .toList();
  }

  set dbPm25(List<ForecastData>? value) {
    if (value == null) {
      value = null;
    } else {
      pm25 = value
          .map((e) => ForecastData(
              id: e.id, avg: e.avg, day: e.day, max: e.max, min: e.min))
          .toList();
    }
  }

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
