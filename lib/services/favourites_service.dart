import 'dart:convert';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/core/keys.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';

class FavouritesService with ListenableServiceMixin {
  final _preferences = locator<SharedPreferencesService>();

  final _favourites = ReactiveValue<Set<SearchData?>>(<SearchData?>{});
  FavouritesService() {
    listenToReactiveValues([_favourites]);
    retrieveAllFavourites();
  }

  Set<SearchData?> get favourites => _favourites.value;

  // Future<void> addFavourite(SearchData item) async {
  //   _favourites.value.add(item);
  //   await updateLocal();
  // }

  bool isFavourite(SearchData item) => _favourites.value.contains(item);

  Future<void> removeFavourite(SearchData item) async {
    _favourites.value.remove(item);
    await updateLocal();
  }

  Future<void> retrieveAllFavourites() async {
    final fSetJson = _preferences.read(kFavouritesKey) ?? '[]';
    final fSetMap = jsonDecode(fSetJson) as List<dynamic>;
    _favourites.value = fSetMap.map((e) => SearchData.fromJson(e)).toSet();
  }

  Future<void> onFavouriteTap(SearchData item) async {
    if (_favourites.value.contains(item)) {
      _favourites.value.remove(item);
    } else {
      _favourites.value.add(item);
    }
    await updateLocal();
    notifyListeners();
  }

  Future<void> updateLocal() async {
    final fSetMap = _favourites.value.map((e) => e?.toJson()).toList();
    final fMap = jsonEncode(fSetMap);
    await _preferences.write(key: kFavouritesKey, value: fMap);
  }
}
