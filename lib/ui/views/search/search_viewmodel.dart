import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/favourites_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends FormViewModel
    with ListenableServiceMixin, Initialisable {
  final _aqiService = locator<AirQualityService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _favouritesService = locator<FavouritesService>();
  final _preferences = locator<SharedPreferencesService>();

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

  bool isFavourite(SearchData item) {
    return _favouritesService.isFavourite(item);
  }

  Future<void> onFavouriteTap(SearchData item) async {
    await _favouritesService.onFavouriteTap(item);
    notifyListeners();
  }

  Future<void> persistResult() async {
    if (_preferences.hasKey(kSearchResultKey)) {
      List<String> listString = _preferences.readList(kSearchResultKey);
      final list =
          listString.map((e) => SearchData.fromJson(jsonDecode(e))).toList();
      _result.value = list;
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

  @override
  List<ListenableServiceMixin> get listenableServices => [_favouritesService];

  @override
  Future<void> initialise() async {
    await persistResult();
  }
}
