// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Collection<User>('users')
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
}

final userRef = UserCollectionReference();

const _$$_UserFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'email': 'email',
  'avatar': 'avatar',
  'verified': 'verified',
};
