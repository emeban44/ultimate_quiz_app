import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth database = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    try {
      await database
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => log(value.toString()),
          );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await database
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => log(value.toString()),
          );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await database.signOut();
    } catch (error) {
      rethrow;
    }
  }
}
