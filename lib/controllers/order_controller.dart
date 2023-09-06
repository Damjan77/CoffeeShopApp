import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{

  void increaseSugar(Coffee item) {
    if (item.sugar < 10) {
      item.sugar++;
    }
  }

  void decreaseSugar(Coffee item) {
    if (item.sugar > 0) {
      item.sugar--;
    }
  }

  void toggleMilk(Coffee item) {
    item.milk = !item.milk;
  }
}