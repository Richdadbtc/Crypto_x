import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../data/models/crypto_model.dart';

class CryptoCard extends StatelessWidget {
  final CryptoModel crypto;

  const CryptoCard({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: crypto.symbol == 'BTC' 
                ? Colors.orange 
                : Colors.blue,
            child: Text(
              crypto.symbol,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${crypto.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${crypto.amount}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 40,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      crypto.chartData.length,
                      (index) => FlSpot(index.toDouble(), crypto.chartData[index]),
                    ),
                    isCurved: true,
                    color: crypto.percentChange >= 0 ? Colors.green : Colors.red,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${crypto.percentChange >= 0 ? '+' : ''}${crypto.percentChange.toStringAsFixed(2)}%',
            style: TextStyle(
              color: crypto.percentChange >= 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}