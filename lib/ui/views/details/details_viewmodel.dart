import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/core/utils/date_formatter.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/pollution_level.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DetailsViewModel extends BaseViewModel {
  late AirQuality airQuality;

  Color get colorLegend => getColorLegend(airQuality.aqi!);
  Color get textColor => getColorLegendTextColor(airQuality.aqi!);
  String get healthImplication => getHealthImplications(airQuality.aqi!);
  PollutionLevel get pollutionLevel => getPollutionLevel(airQuality.aqi!);

  final today = DateTime.now();
  String get formattedDate => dateFormatter(today.toIso8601String());

  void init(AirQuality aqi) {
    airQuality = aqi;
  }
}
