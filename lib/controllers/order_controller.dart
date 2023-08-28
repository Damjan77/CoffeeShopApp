import 'package:get/get.dart';

class OrderController extends GetxController{
  var item = Get.arguments;

  void increaseSugar( item) {
      item.sugar += 1;
  }

  void decreaseSugar( item) {
      if (item.sugar > 0) {
        item.sugar -= 1;
      }
  }

  void milk( item) {
      if (item.milk) {
        item.milk = false;
      } else {
        item.milk = true;
      }
  }
}