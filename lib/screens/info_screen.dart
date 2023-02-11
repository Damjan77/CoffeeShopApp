import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {

  InfoScreen();

  @override
  _InfoState createState() => _InfoState();
}


class _InfoState extends State<InfoScreen> {
  _InfoState();

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