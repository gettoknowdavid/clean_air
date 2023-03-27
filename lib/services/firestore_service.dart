import 'package:clean_air/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class FirestoreService {
  Future<void> storeUser(User? user) async {
    if (user == null) {
      return;
    }

    try {
      return await userRef.doc(user.uid).set(user);
    } on fb.FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> getUser(String uid) async {
    try {
      final snapshot = await userRef.doc(uid).get();
      return snapshot.data;
    } on fb.FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
