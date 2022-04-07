import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? username;

  Future<void> registerUser(
      String email, String password, String username) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log(value.toString());
        sendEmailVerification(auth.currentUser!);
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .set({'username': username});
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> fetchUserData() async {
    try {
      final userResponse = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .get();
      log(userResponse.data().toString());
      username = userResponse.data()?['username'];
      notifyListeners();
    } on FirebaseException {
      rethrow;
    }
  }

  Future<void> sendEmailVerification(User user) async {
    try {
      await user.sendEmailVerification();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => log(value.toString()),
          );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await auth.signOut();
    } catch (error) {
      rethrow;
    }
  }
}
