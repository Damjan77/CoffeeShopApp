// ignore_for_file: prefer_const_constructors

import 'package:coffe_shop_app/camera/preview_page.dart';
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/model/CoffeeShop.dart';
import 'package:coffe_shop_app/model/Location.dart';
import 'package:coffe_shop_app/model/coffee.dart';
import 'package:coffe_shop_app/screens/cart_screen.dart';
import 'package:coffe_shop_app/screens/google_map_screen.dart';
import 'package:coffe_shop_app/screens/login_screen.dart';
import 'package:coffe_shop_app/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = "homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userAddress;
  int _selectedIndex = -1;
  List<Coffee> _coffees = <Coffee>[];
  List<Coffee> _cartList = <Coffee>[];

  List<CoffeeShop> shops = [
    CoffeeShop(
        shopName: "Kratovo coffee Shop",
        location: Location(latitude: 42.078050, longitude: 22.181713)),
    CoffeeShop(
        shopName: "Kavadarci coffee Shop",
        location: Location(latitude: 41.433081, longitude: 22.006034)),
    CoffeeShop(
        shopName: "Bitola coffee Shop",
        location: Location(latitude: 41.031556, longitude: 21.352376)),
    CoffeeShop(
        shopName: "Skopje coffee Shop",
        location: Location(latitude: 42.004906, longitude: 21.409890)),
  ];

  void _populateCoffees() {
    var list = <Coffee>[
      Coffee(
          name: 'Espresso',
          price: 60,
          image: 'assets/images/espresso.png',
          sugar: 0,
          milk: false),
      Coffee(
          name: 'Macchiato',
          price: 60,
          image: 'assets/images/machiato.png',
          sugar: 0,
          milk: false),
      Coffee(
          name: 'Cappuccino',
          price: 80,
          image: 'assets/images/cappuccino.png',
          sugar: 0,
          milk: false),
      Coffee(
          name: 'Iced Coffee',
          price: 100,
          image: 'assets/images/iced-coffee.png',
          sugar: 0,
          milk: false),
      Coffee(
          name: 'Double Espresso',
          price: 100,
          image: 'assets/images/espresso.png',
          sugar: 0,
          milk: false),
      Coffee(
          name: 'Affogato',
          price: 90,
          image: 'assets/images/affogato.png',
          sugar: 0,
          milk: false),
    ];

    setState(() {
      _coffees = list;
    });
  }

  @override
  void initState() {
    super.initState();
    _populateCoffees();
  }

  Future _signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        print("User signed out");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } on FirebaseAuthException catch (e) {
      print("ERROR HERE");
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFFEFC7),
          selectedItemColor:
              _selectedIndex == -1 ? Color(0xFF7B5B36) : Colors.grey[700],
          unselectedItemColor: Color(0xFF7B5B36),
          currentIndex: _selectedIndex == -1 ? 0 : _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
              ),
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline_rounded,
              ),
              label: "Info",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              label: "Logout",
            )
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
            } else if (index == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MapScreen(),
              ));
            } else if (index == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InfoScreen(),
              ));
            } else {
              _signOut();
            }
          },
        ),
        appBar: CustomAppBar(
          appBar: AppBar(),
          widgets: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 23.0, top: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PreviewPage()));
                  },
                  child: Icon(Icons.photo_library),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 33.0),
                child: GestureDetector(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Icon(
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    if (_cartList.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartScreen(_cartList),
                        ),
                      );
                    }
                  },
                )),
          ],
        ),
        body: _createBody());
  }

  GridView _createBody() {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _coffees.length,
      itemBuilder: (context, index) {
        var item = _coffees[index];
        return Card(
            color: Color.fromRGBO(225, 166, 107, 100),
            elevation: 4.0,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      item.image,
                      height: 100,
                    ),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.price.toString() + ' MKD',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          _cartList.add(item);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
