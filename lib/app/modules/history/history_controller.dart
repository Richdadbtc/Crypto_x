import 'package:get/get.dart';
import '../../data/models/transaction_model.dart';

class HistoryController extends GetxController {
  final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
  final RxDouble totalReceived = 15719.00.obs;
  final RxDouble totalSent = 1500.00.obs;
  final RxString selectedFilter = 'ALL'.obs;

  final List<String> filters = ['ALL', 'BTC', 'ETH', 'LTC'];

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    final now = DateTime.now();
    
    transactions.value = [
      TransactionModel(
        symbol: 'LTC',
        amount: -0.95,
        value: 60,
        date: DateTime(now.year, now.month, now.day, 19, 53),
        isReceived: false,
      ),
      TransactionModel(
        symbol: 'BTC',
        amount: -0.004,
        value: 60,
        date: DateTime(now.year, now.month, now.day, 13, 25),
        isReceived: false,
      ),
      TransactionModel(
        symbol: 'ETH',
        amount: -0.535464,
        value: 100,
        date: DateTime(now.year, now.month, now.day, 19, 53),
        isReceived: false,
      ),
      TransactionModel(
        symbol: 'ETH',
        amount: -0.42,
        value: 85,
        date: DateTime(now.year, now.month, now.day - 16),
        isReceived: false,
      ),
    ];
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  List<TransactionModel> get filteredTransactions {
    if (selectedFilter.value == 'ALL') {
      return transactions;
    }
    return transactions.where((tx) => tx.symbol == selectedFilter.value).toList();
  }
}