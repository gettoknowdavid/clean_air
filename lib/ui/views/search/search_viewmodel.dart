import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/favourites_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends FormViewModel with ListenableServiceMixin {
  final _aqiService = locator<AirQualityService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _networkService = locator<NetworkService>();
  final _favouritesService = locator<FavouritesService>();

  final _result = ReactiveValue<List<SearchData?>>([]);
  List<SearchData?> get result => _aqiService.searchResult;

  SearchViewModel() {
    listenToReactiveValues([_result]);
  }

  NetworkStatus get networkStatus => _networkService.status;
  User get user => _authService.currentUser!;

  @override
  void dispose() {
    _aqiService.searchResult.clear();
    super.dispose();
  }

  Future<void> onItemSelect(List<double> geo) async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

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
    return _favouritesService.isFavourite(Favourite(
      uid: item.uid,
      aqi: item.aqi,
      name: item.station?.name,
      geo: item.station?.geo,
      time: item.time?.sTime,
    ));
  }

  Future<void> onFavouriteTap(SearchData item) async {
    await _favouritesService.onFavouriteTap(Favourite(
      uid: item.uid,
      aqi: item.aqi,
      name: item.station?.name,
      geo: item.station?.geo,
      time: item.time?.sTime,
    ));
    notifyListeners();
    await _favouritesService.updateLocal();
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
  List<ListenableServiceMixin> get listenableServices => [
        _aqiService,
        _authService,
        _favouritesService,
        _networkService,
      ];
}
