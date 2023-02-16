// ignore_for_file: prefer_const_constructors
import 'package:coffe_shop_app/screens/home_screen.dart';
import 'package:flutter/material.dart';


class OrderSuccessfullScreen extends StatefulWidget {
  static const String idScreen = "homeScreen";

  @override
  _OrderSuccessfullScreenState createState() => _OrderSuccessfullScreenState();
}

class _OrderSuccessfullScreenState extends State<OrderSuccessfullScreen> {

  void redirectHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xFFFCF5C9),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Align(
            child: Text(
              'Your order was successful!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green[400]
              ),
            ), 
          ),
          SizedBox(height: 100),
          Align(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                label: Text("Home", style: TextStyle(fontSize: 24),),
                icon: Icon(Icons.home, size: 25,),
                onPressed: redirectHome,
              ),
            )
          )
        ]),
    );
  }

}
