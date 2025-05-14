import 'package:get/get.dart';
import 'mining_controller.dart';

class MiningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiningController>(
      () => MiningController(),
    );
  }
}