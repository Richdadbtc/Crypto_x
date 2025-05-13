import 'package:get/get.dart';
import '../../data/models/crypto_model.dart';

class HomeController extends GetxController {
  final RxList<CryptoModel> cryptos = <CryptoModel>[].obs;
  final RxDouble totalBalance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCryptos();
    calculateTotalBalance();
  }

  void loadCryptos() {
    cryptos.value = [
      CryptoModel(
        name: 'Bitcoin',
        symbol: 'BTC',
        value: 42830.50,
        amount: 0.235,
        percentChange: 2.34,
        chartData: [42100, 42300, 42500, 42200, 42600, 42830.50],
      ),
      CryptoModel(
        name: 'Ethereum',
        symbol: 'ETH',
        value: 2286.70,
        amount: 3.5,
        percentChange: -1.25,
        chartData: [2300, 2280, 2290, 2270, 2260, 2286.70],
      ),
      CryptoModel(
        name: 'Pi Network',
        symbol: 'PI',
        value: 0.45,
        amount: 1000.0,
        percentChange: 5.67,
        chartData: [0.42, 0.43, 0.44, 0.45, 0.44, 0.45],
      ),
      CryptoModel(
        name: 'Cardano',
        symbol: 'ADA',
        value: 0.58,
        amount: 500.0,
        percentChange: 3.21,
        chartData: [0.55, 0.56, 0.57, 0.58, 0.57, 0.58],
      ),
      CryptoModel(
        name: 'Solana',
        symbol: 'SOL',
        value: 145.20,
        amount: 2.75,
        percentChange: 8.45,
        chartData: [135.0, 138.0, 140.0, 142.0, 144.0, 145.20],
      ),
      CryptoModel(
        name: 'Dogecoin',
        symbol: 'DOGE',
        value: 0.12,
        amount: 1200.0,
        percentChange: -2.15,
        chartData: [0.123, 0.122, 0.121, 0.120, 0.119, 0.12],
      ),
    ];
  }

  void calculateTotalBalance() {
    double total = 0;
    for (var crypto in cryptos) {
      total += crypto.value * crypto.amount;
    }
    totalBalance.value = total;
  }
}