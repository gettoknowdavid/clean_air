import 'package:clean_air/models/pollutant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'iaqi.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@Entity()
class IAqi {
  IAqi({
    @Id() this.id,
    this.dew,
    this.h,
    this.p,
    this.pm25,
    this.t,
    this.w,
  });

  int? id;
  @Transient()
  Pollutant? dew;
  @Transient()
  Pollutant? h;
  @Transient()
  Pollutant? p;
  @Transient()
  Pollutant? pm25;
  @Transient()
  Pollutant? t;
  @Transient()
  Pollutant? w;

  Pollutant? get dbDew {
    return Pollutant(id: dew?.id, v: dew?.v);
  }

  set dbDew(Pollutant? value) {
    if (value == null) {
      value = null;
    } else {
      dew = Pollutant(id: value.id, v: value.v);
    }
  }

  Pollutant? get dbH {
    return Pollutant(id: dew?.id, v: dew?.v);
  }

  set dbH(Pollutant? value) {
    if (value == null) {
      value = null;
    } else {
      h = Pollutant(id: value.id, v: value.v);
    }
  }

  Pollutant? get dbP {
    return Pollutant(id: dew?.id, v: dew?.v);
  }

  set dbP(Pollutant? value) {
    if (value == null) {
      value = null;
    } else {
      p = Pollutant(id: value.id, v: value.v);
    }
  }

  Pollutant? get dbPm25 {
    return Pollutant(id: dew?.id, v: dew?.v);
  }

  set dbPm25(Pollutant? value) {
    if (value == null) {
      value = null;
    } else {
      pm25 = Pollutant(id: value.id, v: value.v);
    }
  }

  Pollutant? get dbT {
    return Pollutant(id: dew?.id, v: dew?.v);
  }

  set dbT(Pollutant? value) {
    if (value == null) {
      value = null;
    } else {
      t = Pollutant(id: value.id, v: value.v);
    }
  }

  Pollutant? get dbW {
    return Pollutant(id: dew?.id, v: dew?.v);
  }

  set dbW(Pollutant? value) {
    if (value == null) {
      value = null;
    } else {
      value = Pollutant(id: value.id, v: value.v);
    }
  }

  factory IAqi.fromJson(Map<String, dynamic> json) => _$IAqiFromJson(json);

  Map<String, dynamic> toJson() => _$IAqiToJson(this);
}
