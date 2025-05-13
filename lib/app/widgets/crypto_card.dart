import 'package:flutter/material.dart';
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
            child: CustomPaint(
              painter: SimpleChartPainter(
                data: crypto.chartData,
                color: crypto.percentChange >= 0 ? Colors.green : Colors.red,
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

class SimpleChartPainter extends CustomPainter {
  final List<double> data;
  final Color color;

  SimpleChartPainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Find min and max values for scaling
    final double minValue = data.reduce((a, b) => a < b ? a : b);
    final double maxValue = data.reduce((a, b) => a > b ? a : b);
    final double range = maxValue - minValue;
    
    // Calculate step size for x-axis
    final double stepX = size.width / (data.length - 1);
    
    // Start path at first point
    path.moveTo(0, size.height - ((data[0] - minValue) / range) * size.height);
    
    // Add points to path
    for (int i = 1; i < data.length; i++) {
      final double x = stepX * i;
      final double normalizedY = (data[i] - minValue) / range;
      final double y = size.height - (normalizedY * size.height);
      path.lineTo(x, y);
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}