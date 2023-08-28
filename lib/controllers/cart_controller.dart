import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Coffee.dart';
import '../view/map_screen.dart';
import '../view/order_screen.dart';

class CartController extends GetxController {

  Future<void> getOrderedItemData(Coffee item) async {
    debugPrint('Card tapped.');
    debugPrint(item.name);
    final dataFromOrder = await Navigator.push(
        Get.context as BuildContext,
      MaterialPageRoute(builder: (context) => OrderScreen(item)),
    ) as Coffee;
    item.name = dataFromOrder.name;
    item.milk = dataFromOrder.milk;
    item.sugar = dataFromOrder.sugar;
  }

  sendItemToMapScreen(List<Coffee> _cart) {
    Get.to(() =>  const MapScreen(), arguments: _cart);
  }
}
