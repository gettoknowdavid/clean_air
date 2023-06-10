// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Collection<User>('users')
@Collection<Favourite>('users/*/favourites')
@freezed
@JsonSerializable(createFactory: false)
class User with _$User {
  const factory User({
    required String uid,
    required String name,
    required String email,
    String? avatar,
    required bool verified,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromFirebase(fb.User firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName!,
      email: firebaseUser.email!,
      verified: firebaseUser.emailVerified,
    );
  }
}

final userRef = UserCollectionReference();

const _$$_UserFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'email': 'email',
  'avatar': 'avatar',
  'verified': 'verified',
};

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class Favourite with _$Favourite {
  factory Favourite({
    required dynamic uid,
    dynamic aqi,
    String? name,
    List<double>? geo,
    @FirestoreTimestampConverter() DateTime? time,
  }) = _Favourite;

  factory Favourite.fromJson(Map<String, dynamic> json) =>
      _$FavouriteFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FavouriteToJson(this);
}

const _$$_FavouriteFieldMap = <String, String>{
  'uid': 'uid',
  'aqi': 'aqi',
  'name': 'name',
  'geo': 'geo',
  'time': 'time',
};
