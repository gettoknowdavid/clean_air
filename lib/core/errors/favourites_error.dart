import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_error.freezed.dart';

@freezed
class FavouritesError with _$FavouritesError {
  const factory FavouritesError.alreadyFavourite() = _AlreadyFavourite;
}
