import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen();

  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<ProfileScreen> {
  _ProfileState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-cropped.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        centerTitle: true,
      ),

      //  body:

    );
  }
}