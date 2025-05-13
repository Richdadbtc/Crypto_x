class CryptoModel {
  final String name;
  final String symbol;
  final double value;
  final double amount;
  final double percentChange;
  final List<double> chartData;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.value,
    required this.amount,
    required this.percentChange,
    required this.chartData,
  });
}