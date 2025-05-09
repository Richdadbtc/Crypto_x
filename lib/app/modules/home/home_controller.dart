import 'package:get/get.dart';
import '../../data/models/crypto_model.dart';

class HomeController extends GetxController {
  final RxDouble totalBalance = 27812.34.obs;
  final RxList<CryptoModel> cryptos = <CryptoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCryptos();
  }

  void loadCryptos() {
    cryptos.value = [
      CryptoModel(
        symbol: 'BTC',
        name: 'Bitcoin',
        amount: 0.028195,
        value: 13894.12,
        percentChange: 4.02,
        chartData: [1.0, 1.1, 1.0, 1.2, 1.3, 1.2, 1.4],
      ),
      CryptoModel(
        symbol: 'ETH',
        name: 'Ethereum',
        amount: 2.29,
        value: 11894.12,
        percentChange: 1.56,
        chartData: [1.0, 1.2, 1.1, 1.0, 0.9, 1.0, 1.1],
      ),
    ];
  }
}