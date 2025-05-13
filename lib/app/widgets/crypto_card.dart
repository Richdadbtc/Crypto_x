import 'package:flutter/material.dart';
import '../data/models/crypto_model.dart';

class CryptoCard extends StatelessWidget {
  final CryptoModel crypto;

  const CryptoCard({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _buildCryptoLogo(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crypto.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    crypto.symbol,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
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
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${crypto.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${crypto.percentChange >= 0 ? '+' : ''}${crypto.percentChange.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: crypto.percentChange >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCryptoLogo() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: _getLogoBackgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/crypto/${crypto.symbol.toLowerCase()}.png',
          errorBuilder: (context, error, stackTrace) {
            // Fallback if image is not found
            return Center(
              child: Text(
                crypto.symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getLogoBackgroundColor() {
    switch (crypto.symbol) {
      case 'BTC':
        return const Color(0xFFF7931A);
      case 'ETH':
        return const Color(0xFF627EEA);
      case 'PI':
        return const Color(0xFFAA33FF);
      case 'ADA':
        return const Color(0xFF0033AD);
      case 'SOL':
        return const Color(0xFF00FFA3);
      case 'DOGE':
        return const Color(0xFFC3A634);
      default:
        return Colors.blue;
    }
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