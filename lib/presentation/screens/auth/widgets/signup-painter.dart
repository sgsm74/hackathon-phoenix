import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class SignUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.45);
    path_0.cubicTo(size.width * 0.40, size.height * 0.35, size.width * 0.4,
        size.height * 0.55, size.width, size.height * 0.40);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = Paint()
      ..color = Constants.primaryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.15);
    path_1.cubicTo(size.width * 0.10, size.height * 0.20, size.width * 0.50,
        size.height * 0.10, size.width * 0.70, size.height * 0.15);

    path_1.cubicTo(size.width * 0.95, size.height * 0.20, size.width * 1.02,
        size.height * 0.30, size.width * 0.80, size.height * 0.35);

    path_1.cubicTo(size.width * 0.5, size.height * 0.42, size.width * 0.3,
        size.height * 0.30, 0, size.height * 0.40);

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(SignUpPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SignUpPainter oldDelegate) => false;
}
