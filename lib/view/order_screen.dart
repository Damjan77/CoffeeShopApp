import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import '../custom/custom_app_bar.dart';
import '../custom/custom_box_widgets.dart';
import '../custom/custom_text_style.dart';

class OrderScreen extends StatefulWidget {
  final Coffee _item;

  OrderScreen(this._item);

  @override
  _OrderState createState() => _OrderState(this._item);
}

class _OrderState extends State<OrderScreen> {
  final Coffee item;
  List<Coffee> _cartList = <Coffee>[].obs;
  final orderController = Get.put(OrderController());

  _OrderState(this.item);

  Expanded expandedWidgetEmpty() {
    return const Expanded(child: Text(''));
  }

  @override
  void initState() {
    super.initState();
    orderController.init(item);
    // orderController.increaseSugar(this.item);
    // orderController.decreaseSugar(this.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        widgets: const <Widget>[],
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text('Customize your order:',
                  style: CustomTextStyle.customTextStyle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(children: <Widget>[
              Image.asset(
                item.image,
                height: 150,
              ),
              Text(
                item.name,
                style: CustomTextStyle.customTextStyle,
              ),
              addVerticalSpace(50),
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
                          color: primaryColor,
                        ),
                        onTap: () {
                          setState(() {
                            orderController.decreaseSugar();
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.sugar.toString(),
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
                          color: primaryColor,
                        ),
                        onTap: () {
                          setState(() {
                            orderController.increaseSugar();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(20),
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
                      value: item.milk,
                      activeColor: primaryColor,
                      onChanged: (bool value) {
                        setState(() {
                          orderController.toggleMilk();
                        });
                      },
                    ),
                  ),
                  expandedWidgetEmpty()
                ],
              ),
              addVerticalSpace(20),
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
                      '${item.price} MKD',
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _cartList.add(item);
          });
          Navigator.pop(context, item);
        },
        backgroundColor: primaryColor,
        label: const Text("DONE"),
        icon: Icon(Icons.done),
      ),
    );
  }
}
