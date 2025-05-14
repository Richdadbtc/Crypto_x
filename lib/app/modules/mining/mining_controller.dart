import 'dart:async';
import 'package:get/get.dart';

class MiningController extends GetxController {
  final RxString remainingTime = '3:59:36'.obs;
  final RxDouble balance = 83.27.obs;
  final RxString rank = 'NEWBIE'.obs;
  final RxBool isMining = true.obs;
  final RxInt progressPercent = 25.obs;
  
  Timer? _timer;
  
  @override
  void onInit() {
    super.onInit();
    startMiningTimer();
  }
  
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
  
  void startMiningTimer() {
    // Parse the initial time
    List<String> timeParts = remainingTime.value.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    int seconds = int.parse(timeParts[2]);
    
    int totalSeconds = hours * 3600 + minutes * 60 + seconds;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds > 0) {
        totalSeconds--;
        
        int h = totalSeconds ~/ 3600;
        int m = (totalSeconds % 3600) ~/ 60;
        int s = totalSeconds % 60;
        
        remainingTime.value = '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
      } else {
        timer.cancel();
        isMining.value = false;
        // Show completion notification
        Get.snackbar(
          'Mining Complete',
          'You have successfully mined Pi tokens!',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }
  
  void claimRewards() {
    // Implement reward claiming logic
    balance.value += 0.5;
    Get.snackbar(
      'Rewards Claimed',
      'You have claimed 0.5 Pi tokens!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void restartMining() {
    isMining.value = true;
    remainingTime.value = '4:00:00';
    startMiningTimer();
  }
}