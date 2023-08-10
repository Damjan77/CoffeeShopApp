import 'dart:developer';
import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import '../custom/custom_app_bar.dart';
import '../custom/custom_text_style.dart';

class OrderScreen extends StatefulWidget {
  final Coffee _item;

  OrderScreen(this._item);

  @override
  _OrderState createState() => _OrderState(this._item);
}

class _OrderState extends State<OrderScreen> {
  final orderController = Get.put(OrderController());
  _OrderState(this._item);

  final Coffee _item;

  void increaseSugarQuantity() {
    setState(() {
      orderController.increaseSugar(_item);
    });
  }

  void decreaseSugarQuantity() {
    setState(() {
      orderController.decreaseSugar(_item);
    });
  }

  void toggleMilk() {
    setState(() {
      orderController.milk(_item);
    });
  }

  Expanded expandedWidgetEmpty(){
    return const Expanded(
      child: Text(''));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
          widgets: const <Widget>[],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed:  () { Navigator.pop(context, _item); },
          backgroundColor: const Color(0xFF7B5B36),
          label: const Text("DONE"),
          icon: Icon(Icons.done),
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
                  style: CustomTextStyle.customTextStyle
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
                  style: CustomTextStyle.customTextStyle,
                ),
                const SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Sugar',
                        textAlign: TextAlign.left,
                        style: CustomTextStyle.customTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.remove_circle,
                            size: 30,
                            color: Color(0xFF7B5B36),
                          ),
                          onTap: () {
                            decreaseSugarQuantity();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _item.sugar.toString(),
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.customTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                        style: CustomTextStyle.customTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Switch(
                        value: _item.milk,
                        activeColor: const Color(0xFF7B5B36),
                        onChanged: (bool value) {
                          toggleMilk();
                        },
                      ),
                    ),
                    expandedWidgetEmpty()
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Total',
                        textAlign: TextAlign.left,
                        style: CustomTextStyle.customTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${_item.price} MKD',
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.customTextStyle,
                      ),
                    ),
                    expandedWidgetEmpty()
                  ],
                ),
              ]),
            )
          ]),
        ));
  }
}
