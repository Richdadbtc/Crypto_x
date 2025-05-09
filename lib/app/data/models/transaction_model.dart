import 'package:intl/intl.dart';

class TransactionModel {
  final String symbol;
  final double amount;
  final double value;
  final DateTime date;
  final bool isReceived;

  TransactionModel({
    required this.symbol,
    required this.amount,
    required this.value,
    required this.date,
    required this.isReceived,
  });

  String get formattedDate => DateFormat('HH:mm').format(date);
  String get fullDate => DateFormat('dd MMM').format(date);
}