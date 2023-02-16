import 'dart:developer';

import 'package:coffe_shop_app/model/coffee.dart';
import 'package:flutter/material.dart';
import '../custom/custom_app_bar.dart';

class OrderScreen extends StatefulWidget {
  final Coffee _item;

  OrderScreen(this._item);

  @override
  _OrderState createState() => _OrderState(this._item);
}

class _OrderState extends State<OrderScreen> {
  _OrderState(this._item);

  final Coffee _item;
  bool _hasMilk = false;
  int _sugarQuantity = 0;

  void increaseSugarQuantity() {
    log(_sugarQuantity.toString());
    setState(() {
      _sugarQuantity += 1;
    });
  }

  void toggleMilk() {
    setState(() {
      if (_hasMilk) {
        _hasMilk = false;
      } else {
        _hasMilk = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        widgets: const <Widget>[],
      ),
      backgroundColor: const Color(0xFFFCF5C9),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'Customize your order:',
                  style: TextStyle(
                      color: Color(0xFF7B5B36),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(children: <Widget>[
                Image.asset(  
                  _item.image,
                  height: 150,
                ),
                Text(
                  _item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Sugar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF7B5B36),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _sugarQuantity.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF7B5B36),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: GestureDetector(
                          child: const Icon(
                            Icons.add_circle,
                            size: 30,
                            color: Color(0xFF7B5B36),
                          ),
                          onTap: () {
                            increaseSugarQuantity();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Milk',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF7B5B36),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    Expanded(
                      child: Switch(
                      value: _hasMilk,
                      activeColor: const Color(0xFF7B5B36),
                      onChanged: (bool value) {
                        toggleMilk();
                      },
                    ),
                    ),
                    const Expanded(
                      child: Text(''),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Total',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF7B5B36),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${_item.price} MKD',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF7B5B36),
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        ''
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ]),
        )
      );
  }
}