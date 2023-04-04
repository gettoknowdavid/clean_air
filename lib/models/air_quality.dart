import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'attributions.dart';
import 'city.dart';
import 'debug.dart';
import 'forecast.dart';
import 'iaqi.dart';
import 'time.dart';

part 'air_quality.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class AirQuality {
  AirQuality({
    this.id,
    this.aqi,
    this.idx,
    this.attributions,
    this.city,
    this.dominentpol,
    this.iaqi,
    this.time,
    this.forecast,
    this.debug,
  });

  @Id()
  int? id;

  int? aqi;

  int? idx;

  @Transient()
  List<Attributions>? attributions;

  @Transient()
  City? city;

  String? dominentpol;

  @Transient()
  IAqi? iaqi;

  @Transient()
  Time? time;

  @Transient()
  Forecast? forecast;

  @Transient()
  Debug? debug;

  Debug? get dbDebug {
    return Debug(id: id, syncValue: debug?.syncValue);
  }

  set dbDebug(Debug? value) {
    if (value == null) {
      value = null;
    } else {
      debug = Debug(id: id, syncValue: value.syncValue);
    }
  }

  Forecast? get dbForecast {
    return Forecast(id: id, daily: forecast?.daily);
  }

  set dbForecast(Forecast? value) {
    if (value == null) {
      value = null;
    } else {
      forecast = Forecast(id: id, daily: value.daily);
    }
  }

  Time? get dbTime {
    return Time(id: id, iso: time?.iso, s: time?.s, tz: time?.tz, v: time?.v);
  }

  set dbTime(Time? value) {
    if (value == null) {
      value = null;
    } else {
      time = Time(
        id: value.id,
        iso: value.iso,
        s: value.s,
        tz: value.tz,
        v: value.v,
      );
    }
  }

  IAqi? get dbIAqi {
    return IAqi(
      id: id,
      dew: iaqi?.dew,
      h: iaqi?.h,
      p: iaqi?.p,
      pm25: iaqi?.pm25,
      t: iaqi?.t,
      w: iaqi?.w,
    );
  }

  set dbIAqi(IAqi? value) {
    if (value == null) {
      value = null;
    } else {
      iaqi = IAqi(
        id: value.id,
        dew: value.dew,
        h: value.h,
        p: value.p,
        pm25: value.pm25,
        t: value.t,
        w: value.w,
      );
    }
  }

  List<Attributions>? get dbAttributions {
    return attributions
        ?.map((e) =>
            Attributions(id: e.id, logo: e.logo, name: e.name, url: e.url))
        .toList();
  }

  set dbAttributions(List<Attributions>? value) {
    if (value == null) {
      value = null;
    } else {
      attributions = value
          .map((e) =>
              Attributions(id: e.id, logo: e.logo, name: e.name, url: e.url))
          .toList();
    }
  }

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);

  Map<String, dynamic> toJson() => _$AirQualityToJson(this);
}
