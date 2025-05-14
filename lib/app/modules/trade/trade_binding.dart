import 'package:get/get.dart';
import 'trade_controller.dart';

class TradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeController>(
      () => TradeController(),
    );
  }
}