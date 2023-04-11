import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/ui/views/favourites/favourites_view.dart';
import 'package:clean_air/ui/views/home/home_view.dart';
import 'package:clean_air/ui/views/profile/profile_view.dart';
import 'package:clean_air/ui/views/search/search_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LayoutService extends BaseViewModel
    with IndexTrackingStateHelper, ListenableServiceMixin {
  final _navigationService = locator<NavigationService>();

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
}
