import 'package:coffe_shop_app/model/coffee.dart';
import 'package:coffe_shop_app/screens/order_screen.dart';
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
        title: Image.asset(
          'assets/images/logo-cropped.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
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
                    onTap: (){
                      debugPrint('Card tapped.');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderScreen(),));
                    },
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
              );
            }),
    );
  }
}
