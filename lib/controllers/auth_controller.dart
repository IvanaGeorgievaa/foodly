import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Authentication/auth.dart';
import '../constants/app_constants.dart';
import '../models/user.dart';


class UserController extends GetxController {
  static UserController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel(cart:[]).obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

 @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseUser.bindStream(FirebaseAuth.instance.idTokenChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {

    if (user != null) {
      //User Logged IN
      userModel.bindStream(listenToUser());
    } else {
      //User Logged out
      
    }
  }


  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value?.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value?.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}