import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString userName = 'John Doe'.obs;
  final RxString email = 'john.doe@example.com'.obs;
  final RxString walletAddress = '0x71C7656EC7ab88b098defB751B7401B5f6d8976F'.obs;
  final RxBool isDarkMode = false.obs;
  final RxBool isNotificationsEnabled = true.obs;
  final RxBool isBiometricEnabled = false.obs;
  
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }
  
  void toggleNotifications() {
    isNotificationsEnabled.value = !isNotificationsEnabled.value;
  }
  
  void toggleBiometric() {
    isBiometricEnabled.value = !isBiometricEnabled.value;
  }
  
  void logout() {
    // Implement logout functionality
    Get.offAllNamed('/home');
  }
}