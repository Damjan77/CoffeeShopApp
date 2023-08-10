import 'package:get/get.dart';
import '../model/Coffee.dart';

class OrderController extends GetxController{

  void increaseSugar(Coffee item) {
      item.sugar += 1;
  }

  void decreaseSugar(Coffee item) {
      if (item.sugar > 0) {
        item.sugar -= 1;
      }
  }

  void milk(Coffee item) {
      if (item.milk) {
        item.milk = false;
      } else {
        item.milk = true;
      }
  }
}