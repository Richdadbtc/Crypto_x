import 'package:get/get.dart';

class WalletController extends GetxController {
  final RxString totalValueBtc = '0.00572499'.obs;
  final RxString totalValueUsd = '594.29'.obs;
  final RxBool isVisible = true.obs;
  
  final RxList<Map<String, dynamic>> portfolioItems = [
    {
      'type': 'Spot',
      'value': '0.00572499',
      'currency': 'BTC',
    },
    {
      'type': 'DEX+',
      'value': '--',
      'currency': 'USD',
    },
    {
      'type': 'Futures',
      'value': '0',
      'currency': 'BTC',
    },
    {
      'type': 'Fiat',
      'value': '0',
      'currency': 'BTC',
    },
    {
      'type': 'Copy Trade',
      'value': '0',
      'currency': 'BTC',
    },
  ].obs;
  
  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
  
  void deposit() {
    // Implement deposit functionality
    Get.snackbar(
      'Deposit',
      'Deposit functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void withdraw() {
    // Implement withdraw functionality
    Get.snackbar(
      'Withdraw',
      'Withdraw functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void transfer() {
    // Implement transfer functionality
    Get.snackbar(
      'Transfer',
      'Transfer functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void convert() {
    // Implement convert functionality
    Get.snackbar(
      'Convert',
      'Convert functionality will be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}