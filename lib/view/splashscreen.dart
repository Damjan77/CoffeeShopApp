import 'package:coffe_shop_app/custom/custom_box_widgets.dart';
import 'package:coffe_shop_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScr extends StatelessWidget {
   static const String idScreen = "splashScreen";

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: LoginScreen(),
      image: Image.asset('assets/images/logo.png'),
      photoSize: 150.0,
      backgroundColor: secondaryColor,
    );
  }
}