import 'package:get/get.dart';
import '../../data/models/crypto_model.dart';

class HomeController extends GetxController {
  final RxList<CryptoModel> cryptos = <CryptoModel>[].obs;
  final RxDouble totalBalance = 0.0.obs;
  final RxBool isBalanceVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCryptos();
    calculateTotalBalance();
  }

  void toggleBalanceVisibility() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }

  void loadCryptos() {
    cryptos.value = [
      CryptoModel(
        name: 'Bitcoin',
        symbol: 'BTC',
        value: 104151.0,
        amount: 0.235,
        percentChange: 1.11,
        chartData: [103000, 103500, 104000, 103800, 104100, 104151],
      ),
      CryptoModel(
        name: 'Ethereum',
        symbol: 'ETH',
        value: 2678.61,
        amount: 3.5,
        percentChange: 7.32,
        chartData: [2500, 2550, 2600, 2650, 2670, 2678.61],
      ),
      CryptoModel(
        name: 'Solana',
        symbol: 'SOL',
        value: 184.554,
        amount: 15.0,
        percentChange: 5.97,
        chartData: [175, 178, 180, 182, 183, 184.554],
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