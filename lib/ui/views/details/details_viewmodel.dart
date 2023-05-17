import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/core/utils/date_formatter.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/c_air_quality.dart';
import 'package:clean_air/models/pollution_level.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends ReactiveViewModel with ListenableServiceMixin {
  late AirQuality airQuality;
  final _airQualityService = locator<AirQualityService>();
  final _bottomSheetService = locator<BottomSheetService>();

  Color get colorLegend => getColorLegend(airQuality.aqi!);
  Color get textColor => getColorLegendTextColor(airQuality.aqi!);
  String get healthImplication => getHealthImplications(airQuality.aqi!);
  PollutionLevel get pollutionLevel => getPollutionLevel(airQuality.aqi!);
  CAirQuality get conditionAQI => _airQualityService.conditionedAQI;

  final today = DateTime.now();
  String get formattedDate => dateFormatter(today.toIso8601String());

  void init(AirQuality aqi) {
    airQuality = aqi;
  }

  Future<void> setHealthCondition() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.condition,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_airQualityService];
}
