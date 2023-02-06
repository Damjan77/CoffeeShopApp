import 'package:coffe_shop_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new LoginScreen(),
      image: new Image.asset('assets/images/logo.png'),
      photoSize: 150.0,
      backgroundColor: const Color(0xFFFFEFC7),
    );
  }
}