import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BaseViewModel with ListenableServiceMixin {
  final _aqiService = locator<AirQualityService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  final _result = ReactiveValue<List<SearchData?>>([]);
  List<SearchData?> get result => _result.value;

  SearchViewModel() {
    listenToReactiveValues([_result]);
  }

  Future<void> onItemSelect(List<double> geo) async {
    setBusy(true);
    final airQuality = await _aqiService.getAqiByGeo(geo[0], geo[1]);

    if (airQuality != null) {
      setBusy(false);
      _navigationService.navigateToNestedDetailsViewInLayoutViewRouter(
        airQuality: airQuality,
        routerId: 1,
      );
    } else {
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        message: kAirQualityErrorMessage,
        variant: SnackbarType.error,
        duration: const Duration(seconds: 4),
      );
    }
  }

  Future<List<SearchData?>> search(String keyword) async {
    setBusy(true);
    _result.value = [];

    final result = await _aqiService.searchByName(keyword);
    _result.value = result.where((e) => e?.aqi != '-').toList();

    setBusy(false);
    return result;
  }
}
