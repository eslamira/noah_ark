import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  final FirebaseAuth _authClient = FirebaseAuth.instance;
  static AuthClient _instance = AuthClient.internal();

  AuthClient.internal();

  factory AuthClient() => _instance;

  // isLoggedIn?
  // Returns FirebaseUser if loggedIn and null if Not LoggedIn
  Future<FirebaseUser> isLoggedIn() async {
    return await _authClient.currentUser();
  }

  // Sign In with Username and Password
  // return firebase user if success and throw exception if failed
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String pass) async {
    return await _authClient.signInWithEmailAndPassword(
        email: email, password: pass);
  }

  // Sign Out From Google Account & FB Account & Firebase _auth
  // No Returns
  Future<void> signOut() async {
    return await _authClient.signOut();
  }
}
