import 'package:flutter/material.dart';
import 'package:synergy/utils/constants.dart';

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Constants.primaryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.20);
    path_1.cubicTo(size.width * 0.40, size.height * 0.30, size.width * 0.8,
        size.height * 0.01, size.width, size.height * 0.15);
    path_1.lineTo(size.width, size.height);
    path_1.lineTo(0, size.height);
    canvas.drawPath(path_1, paint_1);

    Paint paint_2 = Paint()
      ..color = Constants.secondryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_2 = Path();
    path_2.moveTo(0, size.height * 0.4);
    path_2.cubicTo(size.width * 0.45, size.height * 0.35, size.width * 0.5,
        size.height * 0.55, size.width, size.height * 0.32);

    path_2.lineTo(size.width, size.height);
    path_2.lineTo(0, size.height);
    path_2.lineTo(0, size.height * 0.5);
    canvas.drawPath(path_2, paint_2);

    Paint paint_0 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.52);

    path_0.cubicTo(size.width * 0.40, size.height * 0.45, size.width * 0.60,
        size.height * 0.65, size.width, size.height * 0.58);

    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.5);
    canvas.drawPath(path_0, paint_0);

    //canvas.drawShadow(path_2, Colors.grey, 0.1, false);
  }

  @override
  bool shouldRepaint(LoginPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LoginPainter oldDelegate) => false;
}
