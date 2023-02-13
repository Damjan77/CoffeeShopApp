import 'package:coffe_shop_app/model/coffee.dart';
import 'package:coffe_shop_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  _ProfileState();

  final List<Coffee> _cartList = <Coffee>[];

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
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 12.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    const Icon(
                      Icons.shopping_cart,
                      size: 30.0,
                    ),
                    if (_cartList.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _cartList.length.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartScreen(_cartList),
                    ),
                  );
                },
              ))
        ],
      ),
      body: Column(children: const <Widget>[
        ColoredBox(
          color:Color(0xFF7B5B36),
          child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
            'Welcome back, User',
            style: TextStyle(
                color: Color.fromARGB(255, 237, 234, 231),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            ),
          ),
        ),
        ),
        ColoredBox(
          color:Color(0xFF7B5B36),
          child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
            'Check out your recent orders:',
            style: TextStyle(
                color: Color.fromARGB(255, 237, 234, 231),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            ),
          ),
        ),
        ),
      ]
      )
    );
  }
}
