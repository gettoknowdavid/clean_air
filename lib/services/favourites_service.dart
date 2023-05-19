import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/user.dart';
import 'package:stacked/stacked.dart';

import 'auth_service.dart';
import 'network_service.dart';
import 'shared_preferences_service.dart';

class FavouritesService with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _networkService = locator<NetworkService>();
  final _preferences = locator<SharedPreferencesService>();

  final _favourites = ReactiveValue<Set<Favourite?>>(<Favourite?>{});

  FavouritesService() {
    listenToReactiveValues([_favourites]);
  }

  NetworkStatus get networkStatus => _networkService.status;
  User get user => _authService.currentUser!;

  Set<Favourite?> get favourites => _favourites.value;

  bool isFavourite(Favourite item) => _favourites.value.contains(item);

  Future<void> removeFavourite(Favourite item) async {
    _favourites.value.remove(item);
    notifyListeners();
    final favouritesRef = userRef.doc(user.uid).favourites;
    await favouritesRef.doc('${item.uid}').delete();
  }

  Future<void> retrieveAllFavourites() async {
    if (networkStatus == NetworkStatus.connected) {
      await pullFromCloud();
    } else {
      pullFromLocal();
    }
  }

  Future<void> pullFromLocal() async {
    final fSetJson = _preferences.read(kFavouritesKey) ?? '[]';
    final fSetMap = jsonDecode(fSetJson) as List<dynamic>;
    _favourites.value = fSetMap.map((e) => Favourite.fromJson(e)).toSet();
    notifyListeners();
  }

  Future<void> pullFromCloud() async {
    final favouritesRef = userRef.doc(user.uid).favourites;
    final snapshots = await favouritesRef.get();
    final favSet = snapshots.docs.map((e) => e.data).toSet();
    _favourites.value = favSet;
    await updateLocal();
  }

  Future<void> onFavouriteTap(Favourite item) async {
    final favouritesRef = userRef.doc(user.uid).favourites;
    final doc = favouritesRef.doc('${item.uid}');

    if (_favourites.value.contains(item)) {
      _favourites.value.remove(item);
      notifyListeners();
      doc.delete();
    } else {
      _favourites.value.add(item);
      notifyListeners();
      doc.set(item);
    }
  }

  Future<void> updateLocal() async {
    final fSetMap = _favourites.value.map((e) => e?.toJson()).toList();
    final fMap = jsonEncode(fSetMap);
    await _preferences.write(key: kFavouritesKey, value: fMap);
  }
}
