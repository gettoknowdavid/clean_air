import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/favourites_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FavouritesViewModel extends ReactiveViewModel {
  final _aqiService = locator<AirQualityService>();
  final _authService = locator<AuthService>();
  final _favouritesService = locator<FavouritesService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _layoutViewModel = LayoutViewModel();
  final _networkService = locator<NetworkService>();

  FavouritesViewModel() {
    _favouritesService.pullFromCloud();
  }

  Set<Favourite?> get favouritesSet => _favouritesService.favourites;
  List<Favourite?> get favourites => favouritesSet.toList();
  NetworkStatus get networkStatus => _networkService.status;
  User get user => _authService.currentUser!;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _favouritesService,
        _networkService,
      ];

  void navigateToSearchView() {
    _layoutViewModel.handleNavigation(1);
    notifyListeners();
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

  Future<void> delete(Favourite item) async {
    await _favouritesService.removeFavourite(item);
    notifyListeners();
    await _favouritesService.updateLocal();
  }

  bool isFavourite(Favourite item) {
    return _favouritesService.isFavourite(item);
  }
}
