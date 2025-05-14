import 'package:get/get.dart';

class P2PController extends GetxController {
  final RxBool isBuySelected = true.obs;
  final RxString selectedCrypto = 'USDT'.obs;
  final RxString selectedFiat = 'NGN'.obs;
  final RxString amountInput = ''.obs;
  
  final RxList<Map<String, dynamic>> sellers = [
    {
      'initial': 'O',
      'name': 'Ola01',
      'time': '1h ago',
      'orders': 16,
      'completion': 100.00,
      'price': '1,616.1',
      'available': '50,908',
      'minLimit': '5,000',
      'maxLimit': '7,000',
      'paymentMethod': 'Bank Transfer',
      'isLimited': true,
    },
    {
      'initial': 'G',
      'name': 'Gudbae',
      'time': '2h ago',
      'orders': 63,
      'completion': 100.00,
      'price': '1,630',
      'available': '335.1607',
      'minLimit': '20,000',
      'maxLimit': '586,000',
      'paymentMethod': 'PalmPay',
      'isLimited': false,
    },
  ].obs;
  
  void toggleBuySell(bool isBuy) {
    isBuySelected.value = isBuy;
  }
  
  void selectCrypto(String crypto) {
    selectedCrypto.value = crypto;
  }
  
  void selectFiat(String fiat) {
    selectedFiat.value = fiat;
  }
  
  void setAmount(String amount) {
    amountInput.value = amount;
  }
  
  void buyUsdt(String sellerName) {
    // Implement buy USDT functionality
    Get.snackbar(
      'Buy USDT',
      'You are buying USDT from $sellerName',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}