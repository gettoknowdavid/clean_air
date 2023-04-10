import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/ui/views/favourites/favourites_view.dart';
import 'package:clean_air/ui/views/home/home_view.dart';
import 'package:clean_air/ui/views/profile/profile_view.dart';
import 'package:clean_air/ui/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LayoutViewModel extends IndexTrackingViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();

  User? get user => _authService.currentUser;

  String? get firstName => '${user?.name.split(' ')[0]}';

  Widget get getView {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const SearchView();
      case 2:
        return const FavouritesView();
      default:
        return const ProfileView();
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
