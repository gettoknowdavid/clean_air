import 'package:clean_air/models/condition.dart';
import 'package:clean_air/models/daily.dart';
import 'package:clean_air/models/forecast_data.dart';
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

// Tailored message strings for different health conditions
const String _kTMAsthma =
    'Present air quality is dangerous for asthma. Stay indoors and close windows to protect yourself.';
const String _kTMEmphysema =
    'Pollutants present in the air may worsen emphysema. Please wear a nose mask to protect yourself from the bad air.';
const String _kTMBronchitis =
    'If you have bronchitis, this air is unhealthy for you. Please wear a nose mask and reduce your outdoor exercises to protect yourself from the bad air.';
const String _kTMHBP =
    'Present conditions may increase your blood pressure. Please wear a nose mask to protect yourself from the bad air.';
const String _kTMLungCancer =
    'May lead to lung cancer. Please wear a nose mask to protect yourself from the bad air.';
const String _kTMNone =
    'No health condition selected. Please select your preferred health condition.';

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

// Map<Condition, Map<String?, String>> _getTailoredMessages = {
//   Condition.none: {null: _kTMNone},
//   Condition.asthma: {'o3': _kTMAsthma, 'pm25': _kTMAsthma, 'pm10': _kTMAsthma},
//   Condition.hbp: {'o3': _kTMHBP, 'pm25': _kTMHBP, 'pm10': _kTMHBP},
//   Condition.emphysema: {
//     'o3': _kTMEmphysema,
//     'no2': _kTMEmphysema,
//     'pm25': _kTMEmphysema,
//     'pm10': _kTMEmphysema,
//   },
//   Condition.bronchitis: {
//     'no2': _kTMBronchitis,
//     'pm25': _kTMBronchitis,
//     'pm10': _kTMBronchitis,
//   },
//   Condition.lungCancer: {
//     'so2': _kTMLungCancer,
//     'o3': _kTMLungCancer,
//     'no2': _kTMLungCancer,
//     'pm25': _kTMLungCancer,
//     'pm10': _kTMLungCancer,
//   },
// };

// String? tailoredMessage(String? dominantPol, Condition condition) {
//   return _getTailoredMessages[condition]?[dominantPol];
// }

double _calculateAverageO3(List<ForecastData>? data) {
  if (data == null || data.isEmpty) return 0;

  double sum = 0;
  int count = 0;

  for (final datum in data) {
    if (datum.avg != null) {
      sum += datum.avg!;
      count++;
    }
  }

  return count > 0 ? sum / count : 0;
}

String tailoredHealthMessage(Condition condition, [Daily? daily]) {
  if (condition == Condition.none || daily == null) {
    return "No specific health condition selected.";
  }

  final o3Average = _calculateAverageO3(daily.o3);
  final pm25Average = _calculateAverageO3(daily.pm25);
  final pm10Average = _calculateAverageO3(daily.pm10);
  final no2Average = _calculateAverageO3(daily.no2);
  final so2Average = _calculateAverageO3(daily.so2);
  final coAverage = _calculateAverageO3(daily.co);

  // Check pollutant levels for each health condition
  switch (condition) {
    case Condition.asthma:
      if (o3Average > 0.05 || pm25Average > 35.4) {
        return "Air quality may trigger asthma symptoms. Take necessary precautions.  \nMajor Pollutants: Ozone(O3): $o3Average, Particulate Matter(PM25): $pm25Average";
      }
      break;
    case Condition.hbp:
      if (pm25Average > 55.4 || pm10Average > 150.4 || no2Average > 53.4) {
        return "Air quality may affect individuals with high blood pressure. Stay indoors if possible. \nMajor Pollutants: Particulate Matter(PM25): $pm25Average, Particulate Matter(PM10): $pm10Average, Nitrogen Dioxide(NO2): $no2Average";
      }
      break;
    case Condition.bronchitis:
      if (pm10Average > 154.4 || so2Average > 185.9) {
        return "Air quality may worsen bronchitis symptoms. Limit outdoor activities. \nMajor Pollutants: Particulate Matter(PM10): $pm10Average, Sulfur dioxide(SO2): $so2Average";
      }
      break;
    case Condition.lungCancer:
      if (pm25Average > 35.4 || coAverage > 4.4) {
        return "Air quality may be harmful to individuals with lung cancer. Minimize exposure to outdoor air. \nMajor Pollutants: Particulate Matter(PM25): $pm25Average, Carbon monoxide(CO): $coAverage";
      }
      break;
    case Condition.emphysema:
      if (o3Average > 0.07 || so2Average > 35.4) {
        return "Air quality may worsen emphysema symptoms. Avoid prolonged outdoor activities. \nMajor Pollutants: Ozone(O3): $o3Average, Sulfur dioxide(SO2): $so2Average";
      }
      break;
    default:
      return "Invalid health condition selected.";
  }

  return "Air quality is generally safe for the selected health condition.";
}
