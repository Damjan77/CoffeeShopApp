import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/login_screen.dart';

class LogoutService{

  Future signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        print("User signed out");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } on FirebaseAuthException catch (e) {
      print("ERROR HERE");
      print(e.message);
    }
  }
}