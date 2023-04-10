import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/pollution_level.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  AirQuality get airQuality => _navigationService.currentArguments.airQuality;

  Color get colorLegend => getColorLegend(airQuality.aqi!);
  Color get textColor => getColorLegendTextColor(airQuality.aqi!);
  String get healthImplication => getHealthImplications(airQuality.aqi!);
  PollutionLevel get pollutionLevel => getPollutionLevel(airQuality.aqi!);
}
