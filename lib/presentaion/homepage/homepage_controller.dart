import 'package:get/get.dart';

import '../../data/models/homepage_model.dart';


class FavoriteController extends GetxController {
  var isFavoriteList = <bool>[].obs;
  final HomeModel homeModel = HomeModel();
  int itemCount = 0;
  FavoriteController(this.itemCount);

  @override
  void onInit() {
    super.onInit();
    initializeFavorites();
  }

  void initializeFavorites() {
    isFavoriteList.assignAll(List.generate(itemCount, (index) => false));
  }


  void toggleFavorite(int index) {
    isFavoriteList[index] = !isFavoriteList[index];
  }


  bool isFavorite(int index) {
    return isFavoriteList[index];
  }
}
class HomePageController extends GetxController {
  final HomeModel homeModel = HomeModel();
}