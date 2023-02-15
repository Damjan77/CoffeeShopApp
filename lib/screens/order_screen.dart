import 'package:flutter/material.dart';

import '../custom/custom_app_bar.dart';

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
      appBar: CustomAppBar(appBar: AppBar(),
        // title: Text("Find our location"),
      ),

    //  body:

    );
  }
}