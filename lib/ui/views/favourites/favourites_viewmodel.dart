import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/favourites_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FavouritesViewModel extends ReactiveViewModel with Initialisable {
  final _aqiService = locator<AirQualityService>();
  final _favouritesService = locator<FavouritesService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _layoutViewModel = LayoutViewModel();

  Set<SearchData?> get favouritesSet => _favouritesService.favourites;
  List<SearchData?> get favourites => favouritesSet.toList();

  @override
  List<ListenableServiceMixin> get listenableServices => [_favouritesService];

  @override
  Future<void> initialise() async {
    await _favouritesService.retrieveAllFavourites();
  }

  void navigateToSearchView() {
    _layoutViewModel.handleNavigation(1);
    notifyListeners();
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

  Future<void> delete(SearchData item) async {
    await _favouritesService.removeFavourite(item);
    notifyListeners();
  }

  bool isFavourite(SearchData item) {
    return _favouritesService.isFavourite(item);
  }
}
