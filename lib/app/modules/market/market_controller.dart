import 'package:get/get.dart';

class MarketController extends GetxController {
  final RxString selectedCategory = 'Spot'.obs;
  final RxString selectedFilter = 'All'.obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}