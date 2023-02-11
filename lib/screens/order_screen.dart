import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {

  OrderScreen();

  @override
  _OrderState createState() => _OrderState();
}


class _OrderState extends State<OrderScreen> {
  _OrderState();

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