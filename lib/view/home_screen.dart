// ignore_for_file: prefer_const_constructors
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/custom/custom_text_style.dart';
import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:coffe_shop_app/view/cart_screen.dart';
import 'package:coffe_shop_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom/custom_box_widgets.dart';
import '../custom/custom_string.dart';
import '../services/gallery_service.dart';
import '../services/logout_service.dart';
import 'coffee_shops_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = "homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LogoutService _logoutController = Get.put(LogoutService());
  late String userAddress;
  int _selectedIndex = -1;
  List<Coffee> _coffees = <Coffee>[];
  List<Coffee> _cartList = <Coffee>[];

  void _populateCoffees() {
    var list = <Coffee>[
      Coffee(
          id: generateRandomString(3),
          name: 'Espresso',
          price: 60,
          image: 'assets/images/espresso.png',
          sugar: 0,
          milk: false),
      Coffee(
          id: generateRandomString(3),
          name: 'Macchiato',
          price: 60,
          image: 'assets/images/machiato.png',
          sugar: 0,
          milk: false),
      Coffee(
          id: generateRandomString(3),
          name: 'Cappuccino',
          price: 80,
          image: 'assets/images/cappuccino.png',
          sugar: 0,
          milk: false),
      Coffee(
          id: generateRandomString(3),
          name: 'Iced Coffee',
          price: 100,
          image: 'assets/images/iced-coffee.png',
          sugar: 0,
          milk: false),
      Coffee(
          id: generateRandomString(3),
          name: 'Double Espresso',
          price: 100,
          image: 'assets/images/espresso.png',
          sugar: 0,
          milk: false),
      Coffee(
          id: generateRandomString(3),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: secondaryColor,
          selectedItemColor:
              _selectedIndex == -1 ? primaryColor : Colors.grey[700],
          unselectedItemColor: primaryColor,
          currentIndex: _selectedIndex == -1 ? 0 : _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  if (_cartList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 6.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              label: "Order",
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
              if (_cartList.isNotEmpty) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartScreen(_cartList),
                  ),
                );
              }
            } else {
              _logoutController.signOut(context);
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GalleryService()));
                  },
                  child: Icon(Icons.photo_library),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CoffeeShopsScreen()));
                },
                child: Icon(Icons.storefront),
              ),
            ),
          ],
        ),
        body: _createBody());
  }

  Column _createBody() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(8)),
        Text(
          "Add an item and click on cart to continue your order",
          style: CustomTextStyle.subtitleTextStyle,
          textAlign: TextAlign.center,
        ),
        Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
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
                }))
      ],
    );
  }
}
