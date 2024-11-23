import 'package:get/get.dart';

import '../../data/models/detailPage_model.dart';

class IceCreamController extends GetxController {
  var selectedToppings = <String>[].obs;
  final IceCream iceCream;
  IceCreamController(this.iceCream);
  void addTopping(String topping) {
    if (!selectedToppings.contains(topping)) {
      selectedToppings.add(topping);
    }
  }
  void removeTopping(String topping) {
    selectedToppings.remove(topping);
  }
}