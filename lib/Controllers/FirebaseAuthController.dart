import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/View/Auth/SignInScreen.dart';

import '../View/HomeScreen.dart';
import '../View/widegts/snackbar.dart';

class FirebaseAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signUp(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.to(() => SignInScreen());
      showInSnackBar("User Created Successfully", color: Colors.green,icon:  CupertinoIcons.checkmark_alt_circle);
      print('User signed up: ${userCredential.user!.email}');
    } catch (e) {
      showInSnackBar("Something went wrong", color: Colors.red,icon: CupertinoIcons.clear_circled);
      print('Error signing up: $e');
    }
  }

  Future<void> signIn(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
       showInSnackBar("Sign In Successfully", color: Colors.green,icon:  CupertinoIcons.checkmark_alt_circle);
      Get.to(() => HomeScreen());
      print('Signed in: ${userCredential.user!.email}');
    } catch (e) {
      showInSnackBar("Something went wrong", color: Colors.red,icon: CupertinoIcons.clear_circled);
      print('Error signing in: $e');
    }
  }
}
