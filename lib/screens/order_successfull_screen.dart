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
      appBar: null,
      backgroundColor: const Color(0xFFFCF5C9),
      body: Container(
        child: Center(
         child: Text(
            'Your order was successful!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green[400]
            ),
          ), 
        )
      )
    );
  }

}
