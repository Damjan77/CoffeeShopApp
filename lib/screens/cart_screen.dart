import 'package:coffe_shop_app/model/coffee.dart';
import 'package:coffe_shop_app/screens/coffee_shops_screen.dart';
import 'package:coffe_shop_app/screens/order_screen.dart';
import 'package:coffe_shop_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../custom/custom_app_bar.dart';
import 'order_successfull_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Coffee> _cart;

  CartScreen(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<CartScreen> {
  _CartState(this._cart);
  double total = 0;
  List<Coffee> _cart;

  void _updateTotal() {
    total = 0;
    for (int i = 0; i < _cart.length; i++) {
      total += _cart[i].price;
    }
    //print("TOTAL " + total.toString());
  }

  @override
  void initState() {
    super.initState();
    _updateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CoffeeShopsScreen(),
            ));
          },
          backgroundColor: Color.fromRGBO(225, 166, 107, 100),
          label: Text("CHECKOUT"),
          icon: Icon(Icons.shopping_cart_checkout),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: CustomAppBar(appBar: AppBar(), widgets: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 30.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 30.0,
                    ),
                  ],
                ),
                onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                },
              ))
        ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            _cart.isEmpty
                ? Padding(
                padding: EdgeInsets.only(top: 20, right: 5),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Your cart is currently empty!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ))
                : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "CLICK ON YOUR COFFEE TO EDIT IT",
                    style: TextStyle(
                      color: Color(0xFF7B5B36),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      var item = _cart[index];
                      return Card(
                        color: Color.fromRGBO(225, 166, 107, 100),
                        clipBehavior: Clip.hardEdge,
                        elevation: 4.0,
                        child: ListTile(
                          leading: Image.asset(
                            item.image,
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.price.toString() + " MKD"),
                          onTap: () {
                            debugPrint('Card tapped.');
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderScreen(item),
                            ));
                          },
                          trailing: GestureDetector(
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  _cart.remove(item);
                                  _updateTotal();
                                });
                              }),
                        ),
                      );
                    }),
                Padding(
                    padding: EdgeInsets.only(top: 10, right: 5),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "TOTAL: " + total.toString() + " MKD",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B5B36),
                          fontSize: 20,
                        ),
                      ),
                    ))
              ],
            )
          ]),
        )
    );
  }
}
