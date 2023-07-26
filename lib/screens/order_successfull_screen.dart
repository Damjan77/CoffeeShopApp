// ignore_for_file: prefer_const_constructors
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:coffe_shop_app/model/Map_model.dart';
import 'package:coffe_shop_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OrderSuccessfullScreen extends StatelessWidget {
  static const String idScreen = "orderSuccessfullScreen";

  const OrderSuccessfullScreen({super.key, required this.shop});

  final MapModel shop;

  //final Order order;

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as Coffee;

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        widgets: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 30.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.add_business_rounded,
                      size: 30.0,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your choice was: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.brown),
                    ),
                    Card(
                      color: const Color(0xFFFFEFC7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.coffee_rounded,
                                color: Colors.brown,
                                size: 32,
                              ),
                              Container(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(shop.name,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Location: " + shop.vicinity,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Text(
                      "Your order is: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.brown),
                    ),
                    Card(
                      color: const Color(0xFFFFEFC7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                order.image,
                                height: 80,
                              ),
                              Container(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(order.name,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Milk: ${order.milk}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

// class _OrderSuccessfullScreenState extends StatelessWidget{
//
//   void redirectHome() {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed:  () {
//           Navigator.of(context).push(
//               MaterialPageRoute(
//               builder: (context) => HomeScreen(),));
//         },
//         backgroundColor: const Color(0xFF7B5B36),
//         label: const Text("HOME"),
//         icon: Icon(Icons.home),
//       ),
//       appBar: CustomAppBar(
//         appBar: AppBar(),
//         widgets: [],
//       ),
//       backgroundColor: const Color(0xFFFCF5C9),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//           Align(
//             child: Text(
//               'Your order was successful!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF7B5B36)
//               ),
//             ),
//           ),
//           SizedBox(height: 10,),
//           Text("Thank you!",
//             style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF7B5B36)
//             ),)
//         ]),
//     );
//   }
//
// }
