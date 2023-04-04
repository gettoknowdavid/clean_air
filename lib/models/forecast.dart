import 'package:clean_air/models/daily.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'forecast.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class Forecast {
  @Id()
  int? id;

  @Transient()
  Daily? daily;

  Forecast({this.id, this.daily});

  Daily? get dbDaily {
    return Daily(
      id: id,
      o3: daily?.o3,
      pm10: daily?.pm10,
      pm25: daily?.pm25,
    );
  }

  set dbDaily(Daily? value) {
    if (value == null) {
      value = null;
    } else {
      daily = Daily(
        id: value.id,
        o3: value.o3,
        pm10: value.pm10,
        pm25: value.pm25,
      );
    }
  }

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
