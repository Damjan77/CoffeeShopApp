import 'package:coffe_shop_app/services/login_service.dart';
import 'package:coffe_shop_app/view/register_screen.dart';
import 'package:flutter/material.dart';

import '../custom/custom_box_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String idScreen = "loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService loginService = LoginService();

  bool loginFail = false;
  bool passwordError = false;
  bool emailError = false;
  String loginErrorMessage = "test";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: secondaryColor,
        body: Container(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.1, 20, 0),
                child: Column(children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  addVerticalSpace(20),
                  TextField(
                    controller: loginService.emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: emailError ? loginErrorMessage : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  addVerticalSpace(20),
                  TextField(
                    controller: loginService.passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: passwordError ? loginErrorMessage : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    obscureText: true,
                  ),
                  addVerticalSpace(20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    label: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(
                      Icons.lock_open,
                      size: 25,
                    ),
                    onPressed: () {
                      loginService.signIn(context, loginFail, passwordError,
                          emailError, loginErrorMessage);
                    },
                  ),
                  addVerticalSpace(20),
                  signUpOption()
                ]))));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.black87),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: const Text(
            " Register",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
