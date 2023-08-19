// ignore_for_file: prefer_const_constructors
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/custom/custom_text_style.dart';
import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:coffe_shop_app/model/Map_model.dart';
import 'package:coffe_shop_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import '../custom/custom_box_widgets.dart';

class OrderSuccessfullScreen extends StatefulWidget {
  static const String idScreen = "orderSuccessfullScreen";

  OrderSuccessfullScreen({super.key, required this.shop});

  final MapModel shop;

  @override
  State<OrderSuccessfullScreen> createState() => _OrderSuccessfullScreenState();
}

class _OrderSuccessfullScreenState extends State<OrderSuccessfullScreen> {
  late Coffee item;

  _OrderSuccessfullScreenState();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic orders = ModalRoute.of(context)!.settings.arguments as List<Coffee>;

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
                      Icons.home,
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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(10),
                      Text(
                        "Your order is: ",
                        style: CustomTextStyle.subtitleTextStyle,
                      ),
                      addVerticalSpace(10),
                      if (orders.isNotEmpty)
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: orders.length,
                            itemBuilder: (context, i) {
                              item = orders[i];
                            return Card(
                              color: secondaryColor,
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
                                        item.image,
                                        height: 80,
                                      ),
                                      Container(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(item.name,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyle
                                                    .subtitleTextStyle),
                                            addVerticalSpace(10),
                                            Text("Milk: ${item.milk ? "yes" : "no"}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyle.infoTextStyle),
                                            addVerticalSpace(10),
                                            Text("Sugar: ${item.sugar}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyle.infoTextStyle),
                                            addVerticalSpace(10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          }
                        ),
                      addVerticalSpace(25),
                      Text(
                        "It is waiting for you at: ",
                        style: CustomTextStyle.subtitleTextStyle,
                      ),
                      addVerticalSpace(10),
                      Card(
                        color: secondaryColor,
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
                                  Icons.cottage,
                                  color: primaryColor,
                                  size: 32,
                                ),
                                Container(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.shop.name,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              CustomTextStyle.subtitleTextStyle),
                                      addVerticalSpace(10),
                                      Text("Location: " + widget.shop.vicinity,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyle.infoTextStyle),
                                      addVerticalSpace(10),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      addVerticalSpace(25),
                      Text(
                        "Have a nice coffee!",
                        style: CustomTextStyle.subtitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
