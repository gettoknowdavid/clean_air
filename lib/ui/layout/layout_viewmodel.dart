import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/ui/views/favourites/favourites_view.dart';
import 'package:clean_air/ui/views/home/home_view.dart';
import 'package:clean_air/ui/views/profile/profile_view.dart';
import 'package:clean_air/ui/views/search/search_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LayoutViewModel extends IndexTrackingViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  User? get user => _authService.currentUser;

  String? get firstName => '${user?.name.split(' ')[0]}';

  void handleNavigation(int index) {
    setIndex(index);
    switch (index) {
      case 0:
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 1:
        _navigationService.replaceWithTransition(
          SearchView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 2:
        _navigationService.replaceWithTransition(
          const FavouritesView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 3:
        _navigationService.replaceWithTransition(
          const ProfileView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      default:
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
