import 'dart:math';

import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int total;
  final int current;
  final double height;

  const ProgressWidget(
      {super.key,
      required this.total,
      required this.current,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.maxFinite, height),
      painter: ProgressWidgetPainter(
        total: total,
        current: current,
      ),
    );
  }
}

class ProgressWidgetPainter extends CustomPainter {
  final int total;
  final int current;

  ProgressWidgetPainter({
    required this.total,
    required this.current,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final ratio = ((current / total) * 100).toInt();
    final step = (size.width - 8) / 100;
    // final progressCenter = Offset(size.width / 2, size.height / 5 * 4);
    late Offset currPos;
    final totalPaint = Paint()..color = const Color(0xffffffff).withOpacity(.2);
    final totalPath = Path();

    for (int i = 0; i < 2; i++) {
      final dy = size.height / 5 * 4;
      final dx = 4 + (size.width - 8) * i;
      final oval = Rect.fromCircle(center: Offset(dx, dy), radius: 4);
      totalPath.arcTo(oval, pi / 2 + pi * i, pi, false);
    }
    canvas.drawPath(totalPath, totalPaint);

    final currPaint = Paint()..color = const Color(0xffffffff);
    final currPath = Path();

    // currPath.arcTo(rect, startAngle, sweepAngle, forceMoveTo)
    for (int i = 0; i < 2; i++) {
      final dy = size.height / 5 * 4;
      final dx = 4 + step * ratio * i;
      currPos = Offset(dx, dy);
      final oval = Rect.fromCircle(center: Offset(dx, dy), radius: 4);
      currPath.arcTo(oval, pi / 2 + pi * i, pi, false);
    }

    canvas.drawPath(currPath, currPaint);

    final thumbPaint = Paint()..color = const Color(0xffffffff).withOpacity(.5);
    canvas.drawCircle(currPos, 20, thumbPaint);
    canvas.drawCircle(currPos, 8, Paint()..color = const Color(0xffffffff));

    final progressBoxPaint = Paint()..color = const Color(0xffffffff);
    final progressBoxPath = Path();
    const d = 40;
    progressBoxPath.moveTo(currPos.dx, currPos.dy - d);
    final oval =
        Rect.fromCircle(center: Offset(currPos.dx, currPos.dy - d), radius: 20);
    progressBoxPath.moveTo(currPos.dx, currPos.dy);
    progressBoxPath.arcTo(oval, 10 * pi / 12, 16 * pi / 12, false);
    canvas.drawPath(progressBoxPath, progressBoxPaint);

    final textPainter = TextPainter()
      ..text = TextSpan(
          text: ratio.toString(),
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff223158),
          ))
      ..textAlign = TextAlign.center
      ..textDirection = TextDirection.ltr;
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(currPos.dx - (textPainter.width / 2),
            currPos.dy - d - (textPainter.height / 2)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
