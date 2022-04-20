import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ultimate_quiz_app/models/user_profile.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? username;
  UserProfile? userProfile;
  bool isAuthenticated = false;

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
      final UserProfile userProfileResponse =
          UserProfile.fromJson(userResponse.data());
      print(userProfileResponse.username! + 'img');
      userProfile = userProfileResponse;
      notifyListeners();
    } on FirebaseException {
      rethrow;
    }
  }

  Future<void> uploadProfileImage(String filePath) async {
    try {
      final String storagePath = 'profilne/${userProfile!.username!}';
      await FirebaseStorage.instance
          .ref()
          .child(storagePath)
          //.child('profilne/drole')
          .putFile(File(filePath))
          .then((p0) async {
        final String imageCloudPath = await p0.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .update({'image_url': imageCloudPath});
        userProfile!.imageURL = imageCloudPath;
      });
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
