import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/condition.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConditionViewModel extends ReactiveViewModel with ListenableServiceMixin {
  final _aqiService = locator<AirQualityService>();
  final _snackBarService = locator<SnackbarService>();

  Condition get conditionFromService => _aqiService.conditionedAQI.condition;

  AirQuality? get airQuality => _aqiService.appAQI;
  final _condition = ReactiveValue<Condition>(Condition.none);
  Condition get condition => _condition.value;

  ConditionViewModel() {
    _condition.value = conditionFromService;
    listenToReactiveValues([_condition]);
  }
  Future<void> setHealthCondition(Condition con) async {
    _condition.value = con;
    notifyListeners();
    if (con == Condition.none) {
      await _aqiService.updateConditionedAQI(_condition.value);
    } else {
      await _aqiService.updateConditionedAQI(
        _condition.value,
        airQuality?.dominentpol,
      );
    }
    notifyListeners();
    _snackBarService.showSnackbar(
      title: 'Health Condition Settings',
      message: 'Preferred health condition has been set to ${condition.name}',
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_aqiService];
}
