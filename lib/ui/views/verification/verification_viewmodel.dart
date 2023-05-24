import 'dart:async';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:clean_air/services/air_quality_service.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/favourites_service.dart';
import 'package:clean_air/services/location_service.dart';
import 'package:clean_air/services/open_mail_app_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerificationViewModel extends ReactiveViewModel
    with Initialisable, ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _openMailAppService = locator<OpenMailAppService>();
  final _airQualityService = locator<AirQualityService>();
  final _favouriteService = locator<FavouritesService>();
  final _locationService = locator<LocationService>();

  VerificationViewModel() {
    listenToReactiveValues([_showVerified]);
  }

  final _showVerified = ReactiveValue<bool>(false);
  bool get showVerified => _showVerified.value;

  Timer? timer;

  // bool get isEmailVerified => _authService.isEmailVerified;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> cancel() => Future.wait([_authService.logout()]);

  Future<void> checkEmailVerified() async {
    setBusy(true);
    final result = await _authService.checkEmailVerified();
    result.fold(
      () {
        setBusy(false);
        _navigationService.clearStackAndShow(Routes.loginView);
      },
      (either) => either.fold(
        (failure) => notifyListeners(),
        (success) {
          setBusy(false);
          timer?.cancel();
          _showVerified.value = true;
          notifyListeners();
        },
      ),
    );
  }

  Future startUp() {
    return Future.wait([
      _locationService.getCurrentLocation(),
      _airQualityService.getCurrentLocationAQI(),
      _airQualityService.getConditionedAQI(),
      _favouriteService.retrieveAllFavourites(),
    ]);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> goHome() async {
    setBusy(true);
    await startUp().whenComplete(
      () => _navigationService.clearStackAndShow(Routes.layoutView),
    );
  }

  @override
  Future<void> initialise() async {
    if (showVerified == false) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        await checkEmailVerified();
        notifyListeners();
      });
    }
  }

  Future<void> openMailApp() async {
    await _openMailAppService.openMailApp();
  }

  Future<void> sendVerification() async {
    final result = await _authService.sendVerificationEmail();

    result.fold(
      (failure) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            userNotFound: (_) => kNoUserFoundErrorMessage,
          ),
        );
      },
      (success) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.success,
          message: kVerificationEmailSentSuccess,
        );
      },
    );
  }
}
