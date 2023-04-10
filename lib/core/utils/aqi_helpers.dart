import 'package:clean_air/models/pollution_level.dart';
import 'package:clean_air/models/weather_type.dart';
import 'package:clean_air/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

const String _kGood =
    'Air quality is considered satisfactory, and air pollution poses little or no risk';

const String _kHazardous =
    'Health alert: everyone may experience more serious health effects';

const String _kModerate =
    'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.';

const String _kUnhealthy =
    'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects.';
const String _kUnhealthyForSensitiveGroups =
    'Members of sensitive groups may experience health effects. The general public is not likely to be affected.';
const String _kVeryUnhealthy =
    'Health warnings of emergency conditions. The entire population is more likely to be affected.';

Color getColorLegend(int index) {
  switch (index ~/ 50) {
    case 0:
      return kGreen;
    case 1:
      return kYellow;
    case 2:
      return kOrange;
    case 3:
      return kRed;
    case 4:
    case 5:
      return kPurple;
    default:
      return kMaroon;
  }
}

Color getColorLegendTextColor(int index) {
  var color = getColorLegend(index);
  var d = 0;
  var luminance =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

  if (luminance > 0.5) {
    d = 0;
  } else {
    d = 229;
  }
  return Color.fromARGB(color.alpha, d, d, d);
}

String getHealthImplications(int index) {
  switch (index ~/ 50) {
    case 0:
      return _kGood;
    case 1:
      return _kModerate;
    case 2:
      return _kUnhealthyForSensitiveGroups;
    case 3:
      return _kUnhealthy;
    case 4:
    case 5:
      return _kVeryUnhealthy;
    default:
      return _kHazardous;
  }
}

PollutionLevel getPollutionLevel(int index) {
  switch (index ~/ 50) {
    case 0:
      return PollutionLevel.good;
    case 1:
      return PollutionLevel.moderate;
    case 2:
      return PollutionLevel.unhealthyForSensitiveGroups;
    case 3:
      return PollutionLevel.unhealthy;
    case 4:
    case 5:
      return PollutionLevel.veryUnhealthy;
    default:
      return PollutionLevel.hazardous;
  }
}

WeatherType getWeatherType(String name) {
  switch (name) {
    case 'dew':
      return WeatherType.dew;
    case 'h':
      return WeatherType.hum;
    case 'p':
      return WeatherType.pres;
    case 't':
      return WeatherType.temp;
    default:
      return WeatherType.wind;
  }
}
