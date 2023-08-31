import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/home_screen.dart';

class LoginService{
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future signIn(BuildContext context,
      bool loginFail, bool passwordError, bool emailError, String loginErrorMessage) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)
          .then((value) {
        print("User signed in");
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } on FirebaseAuthException catch (e){
      print(e.message);
      loginFail = true;
      loginErrorMessage = e.message!;

      if(loginErrorMessage == "There is no user record corresponding to this identifier. The user may have been deleted."){
        emailError = true;
        loginErrorMessage = "User does not exist, please create an account";
      }else {
        passwordError = true;
        loginErrorMessage = "Incorrect password";
      }
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Invalid credentials"),
            content: Text("The email or password you entered is incorrect."),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text("OK"),
              )
            ],
          )
      );
    }
  }

}