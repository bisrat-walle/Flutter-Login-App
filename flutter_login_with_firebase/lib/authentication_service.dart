import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServie {
  final FirebaseAuth _firebaseAuth;

  AuthenticationServie(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signin(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Sign in successfully";
    } on FirebaseAuthException catch (ex) {
      return ex.message;
    }
  }

  Future<String?> signup(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up successfully";
    } on FirebaseAuthException catch (ex) {
      return ex.message;
    }
  }
}
