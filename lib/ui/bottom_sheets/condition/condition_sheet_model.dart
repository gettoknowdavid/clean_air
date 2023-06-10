import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/condition.dart';
import 'package:clean_air/models/daily.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConditionSheetModel extends ReactiveViewModel
    with ListenableServiceMixin {
  final _aqiService = locator<AirQualityService>();

  Condition get conditionFromService => _aqiService.conditionedAQI.condition;

  AirQuality? get airQuality => _aqiService.appAQI;
  final _condition = ReactiveValue<Condition>(Condition.none);
  Condition get condition => _condition.value;

  ConditionSheetModel() {
    _condition.value = conditionFromService;
    listenToReactiveValues([_condition]);
  }

  Future<void> setHealthCondition(
    Function(SheetResponse response)? completer,
    Condition con,
  ) async {
    _condition.value = con;
    notifyListeners();
    if (con == Condition.none) {
      await _aqiService.updateConditionedAQI(_condition.value, Daily.none());
    } else {
      await _aqiService.updateConditionedAQI(
        _condition.value,
        airQuality?.forecast?.daily,
        airQuality?.dominentpol,
      );
    }
    notifyListeners();
    completer!(SheetResponse());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_aqiService];
}
