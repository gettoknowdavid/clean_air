import 'package:firebase_auth/firebase_auth.dart' as fb;

class AuthService {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  Future<fb.User?> login({
    required String email,
    required String password,
  }) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user;
  }

  Future<fb.User?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firebaseAuth.currentUser!.updateDisplayName(name);

    return result.user;
  }

  Future<void> sendEmailVerification() async {
    return _firebaseAuth.currentUser?.sendEmailVerification();
  }
}
