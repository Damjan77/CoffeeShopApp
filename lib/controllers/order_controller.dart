import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  //var item = Get.arguments;
  late Coffee item;

  void init(Coffee coffee) {
    item = coffee;
  }

  void increaseSugar() {
    if (item.sugar < 10) {
      item.sugar++;
    }
  }

  void decreaseSugar() {
    if (item.sugar > 0) {
      item.sugar--;
    }
  }

  void toggleMilk() {
    item.milk = !item.milk;
  }
}