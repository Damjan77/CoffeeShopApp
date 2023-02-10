import 'package:coffe_shop_app/model/coffee.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Coffee> _cart;

  CartScreen(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<CartScreen> {
  _CartState(this._cart);

  List<Coffee> _cart;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                color: Color.fromRGBO(225, 166, 107, 100),
                elevation: 4.0,
                child: ListTile(
                  leading: Image.asset(
                    item.image,
                  ),
                  title: Text(item.name),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
    );
  }
}