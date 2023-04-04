import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/last_aqi.dart';
import 'package:clean_air/services/aqi_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/objectbox_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel with ListenableServiceMixin {
  HomeViewModel() {
    listenToReactiveValues([_newValue, _aqi, _currentValue]);
  }

  final _aqiService = locator<AqiService>();
  final _authService = locator<AuthService>();
  final _objectBox = locator<ObjectBoxService>();
  final _navigationService = locator<NavigationService>();

  final _newValue = ReactiveValue<int>(0);
  int get newValue => _newValue.value;

  final _aqi = ReactiveValue<int?>(
      locator<ObjectBoxService>().store.box<LastAqi>().get(1)?.aqi);
  int? get aqi => _aqi.value;

  int _currentValue = 0;
  int get currentValue => _currentValue;

  bool get isIncreasing => _newValue.value > _currentValue;

  Future<Aqi?> getAqi() async {
    final aqi = await _aqiService.getCurrentLocationAQI();
    if (aqi?.value != null) {
      // _newValue.value = aqi!.value!;
      // _aqi.value = aqi.value;
      return aqi;
    }
    return null;
  }

  @override
  Future<void> futureToRun() async {
    final theNewAqi = await getAqi();
    final theNewAqiValue = theNewAqi?.value;
    final lastAqiValue = _objectBox.store.box<LastAqi>().get(1)?.aqi;
    if (theNewAqiValue == lastAqiValue) {
      return;
    } else {
      _aqi.value = theNewAqiValue;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  // This function updates the current value and triggers the animation
  void updateCurrentValue(int newValue) {
    if (newValue != _currentValue) {
      _currentValue = newValue;
      notifyListeners();
    }
  }
}
