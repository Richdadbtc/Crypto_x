import 'package:get/get.dart';

class TradeController extends GetxController {
  final RxString selectedTab = 'buy'.obs;
  final RxString orderType = 'limit'.obs;
  final RxDouble price = 104075.3.obs;
  final RxDouble amount = 0.00717.obs;
  final RxInt selectedPercentage = 100.obs;
  
  void changeTab(String tab) {
    selectedTab.value = tab;
  }
  
  void changeOrderType(String type) {
    orderType.value = type;
  }
  
  void updatePrice(double newPrice) {
    price.value = newPrice;
  }
  
  void incrementPrice() {
    price.value += 0.1;
  }
  
  void decrementPrice() {
    price.value -= 0.1;
  }
  
  void updateAmount(double newAmount) {
    amount.value = newAmount;
  }
  
  void setPercentage(int percentage) {
    selectedPercentage.value = percentage;
    // Calculate amount based on percentage of available funds
    // This would be implemented based on your wallet logic
  }
  
  double get total => price.value * amount.value;
  
  void executeTrade() {
    // Implement trade execution logic
    Get.snackbar(
      'Trade Executed',
      'Your ${selectedTab.value} order has been placed',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}