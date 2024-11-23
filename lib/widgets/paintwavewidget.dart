import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WavelengthWavePainter extends CustomPainter {
  final double offset;

  WavelengthWavePainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {

    final Shader shader = LinearGradient(
      colors: [
        Colors.pink.shade400.withOpacity(0.3),
        Colors.cyanAccent.withOpacity(0.4),
        Colors.pink.shade400.withOpacity(0.5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Paint paint = Paint()
      ..shader = shader
      ..style = PaintingStyle.fill;

    Path path = Path();
    double waveHeight = 300;
    double waveLength = size.width / 0.8;

    path.lineTo(0, size.height - waveHeight - offset);

    for (double x = 0; x <= size.width; x += waveLength) {
      path.quadraticBezierTo(
          x + (waveLength /22), size.height - offset - (waveHeight * 2),
          x + (waveLength / 1), size.height - waveHeight - offset);
      path.quadraticBezierTo(
          x + (waveLength * 2 / 3), size.height - offset,
          x + waveLength, size.height - waveHeight - offset);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}