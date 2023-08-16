import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Coffee.dart';
import '../view/map_screen.dart';

class CartController extends GetxController {
  late double total;
  late Coffee item;

  sendItemToMapScreen(item) {
    // Navigator.push(
    //     Get.context as BuildContext,
    //     MaterialPageRoute(
    //       builder: (context) => const MapScreen(),
    //       settings: RouteSettings(arguments: item),
    //     ));
    Get.to(() => const MapScreen(), arguments: item);
  }
}
