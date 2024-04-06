import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/Screens/role.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signin(
      {required BuildContext context,
      required String email,
      required String password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.off(() => const Role()))
        .onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }
}
