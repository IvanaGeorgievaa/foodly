import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodly_app/models/user.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/app_constants.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
  late Rx<User> firebaseUser;
  String usersCollection = "users";

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    firebaseFirestore.collection(usersCollection).doc(currentUser?.uid).set({
      "id": currentUser?.uid,
      "email": email,
      "cart": []
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
