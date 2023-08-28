import 'package:coffe_shop_app/controllers/cart_controller.dart';
import 'package:coffe_shop_app/custom/custom_text_style.dart';
import 'package:coffe_shop_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom/custom_app_bar.dart';
import '../model/Coffee.dart';

class CartScreen extends StatefulWidget {
  final List<Coffee> _cart;

  CartScreen(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<CartScreen> {
  double total = 0;
  List<Coffee> _cart = <Coffee>[].obs;
  CartController cartController = Get.put(CartController());

  _CartState(this._cart);


  double updateTotal() {
    total = 0;
    for (int i = 0; i < _cart.length; i++) {
      total += _cart[i].price;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    updateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: CustomTextStyle.infoTextStyle,
                ),
              ))
              : Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Click on your coffee to edit it",
                  style: CustomTextStyle.subtitleTextStyle, textAlign: TextAlign.center,
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
                        onTap: () async {
                           setState(() {
                            cartController.getOrderedItemData(item);
                           });
                        },
                        trailing: GestureDetector(
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                _cart.remove(item);
                                total = updateTotal();
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
                      style: CustomTextStyle.subtitleTextStyle
                    ),
                  ))
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
            cartController.sendItemToMapScreen(_cart);
        },
        backgroundColor: Color.fromRGBO(225, 166, 107, 100),
        label: Text("PICK A SHOP"),
        icon: Icon(Icons.shopping_cart_checkout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
