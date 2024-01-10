import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _authService = FirebaseAuth.instance;

  Future<UserCredential> signInFirebase(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException {
      throw Exception("Error auth service firebase sign in");
    }
  }

  Future<UserCredential> signUpFirebase(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException {
      throw Exception("Error auth service firebase sign up");
    }
  }

  Future<void> logOutFirebase() async {
    await _authService.signOut();
  }
}
