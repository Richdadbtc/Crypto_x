class CryptoModel {
  final String symbol;
  final String name;
  final double amount;
  final double value;
  final double percentChange;
  final List<double> chartData;

  CryptoModel({
    required this.symbol,
    required this.name,
    required this.amount,
    required this.value,
    required this.percentChange,
    required this.chartData,
  });
}