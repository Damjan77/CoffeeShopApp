// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


class OrderSuccessfullScreen extends StatefulWidget {
  static const String idScreen = "homeScreen";

  @override
  _OrderSuccessfullScreenState createState() => _OrderSuccessfullScreenState();
}

class _OrderSuccessfullScreenState extends State<OrderSuccessfullScreen> {
 

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
      body: Container()
    );
  }

}
