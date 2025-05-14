import 'package:get/get.dart';
import 'p2p_controller.dart';

class P2PBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<P2PController>(
      () => P2PController(),
    );
  }
}