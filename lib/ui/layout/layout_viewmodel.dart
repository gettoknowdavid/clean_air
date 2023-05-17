import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/network_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:clean_air/ui/views/favourites/favourites_view.dart';
import 'package:clean_air/ui/views/home/home_view.dart';
import 'package:clean_air/ui/views/profile/profile_view.dart';
import 'package:clean_air/ui/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LayoutViewModel extends IndexTrackingViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();
  final _networkService = locator<NetworkService>();

  LayoutViewModel() {
    listenToReactiveValues([_localProfileAvatar]);
    getLocalProfileAvatar();
  }

  final _localProfileAvatar = ReactiveValue<Image?>(null);
  Image? get localProfileAvatar => _localProfileAvatar.value;
  NetworkStatus get networkStatus => _networkService.status;
  User? get user => _authService.currentUser;
  bool get isConnected => _networkService.status == NetworkStatus.connected;

  Future<void> getLocalProfileAvatar() async {
    if (!_preferences.hasKey(kProfileImageKey) && user?.avatar != null) {
      await _preferences.writeImageFromNetwork(user!.avatar!);
    }

    if (networkStatus == NetworkStatus.disconnected) {
      final result = await _preferences.readImage(kProfileImageKey);
      _localProfileAvatar.value = result;
      notifyListeners();
    }
  }

  String? get firstName => '${user?.name.split(' ')[0]}';

  void handleNavigation(int index) {
    switch (index) {
      case 0:
        setIndex(0);
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 1:
        setIndex(1);
        _navigationService.replaceWithTransition(
          SearchView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 2:
        setIndex(2);
        _navigationService.replaceWithTransition(
          const FavouritesView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 3:
        setIndex(3);
        _navigationService.replaceWithTransition(
          const ProfileView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      default:
    }
    notifyListeners();
  }

  Future<bool> onWillPop() async {
    return await _preferences.delete(kSearchResultKey).whenComplete(() => true);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
