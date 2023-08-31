import 'package:coffe_shop_app/custom/custom_box_widgets.dart';
import 'package:coffe_shop_app/services/register_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String idScreen = "registerScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterService registerService = RegisterService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFFEFC7),
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
                    "Register",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  addVerticalSpace(20),
                  TextField(
                    controller: registerService.emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  addVerticalSpace(20),
                  TextField(
                    controller: registerService.passwordController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    obscureText: true,
                  ),
                  addVerticalSpace(20),
                  TextField(
                    controller: registerService.addressController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  addVerticalSpace(20),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      icon: Icon(
                        Icons.lock_open,
                        size: 25,
                      ),
                      label: Text(
                        "Register",
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {
                        registerService.signUp(context);
                      }),
                  addVerticalSpace(20),
                  registerService.signInOption(context)
                ]))));
  }
}
