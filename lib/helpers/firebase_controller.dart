import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    User? user = result.user;
    // if(result.user != null) user = result.user!;
    return user?.uid;
  }

  Future<String?> signUp(String email, String password) async {
    UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    User? user = cred.user;

    return user?.uid;
  }

  Future<User?> getCurrentUser() async {
    User? user = await _firebaseAuth.currentUser;

    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  // User.sendEmailVerification()
  // User.isEmailVerified
}

enum AuthStatus {
  notDetermined,
  notLoggedIn,
  loggedIn,
}
