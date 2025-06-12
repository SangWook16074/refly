import 'dart:math';

import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int total;
  final int current;
  final double width;
  const ProgressWidget({
    super.key,
    required this.total,
    required this.current,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, 4.0),
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
    late final int ratio;
    // 아무것도 등록하지 않으면 비율은 0
    if (total == 0) {
      ratio = 0;
    } else {
      // 그렇지 않다면 비율 계산
      ratio = ((current / total) * 100).toInt();
    }
    // 전체 진행율 칸 픽셀 계산
    final step = (size.width - 8) / 100;
    late Offset currPos;
    final totalPaint = Paint()..color = const Color(0xffBDBDBD);
    final totalPath = Path();

    for (int i = 0; i < 2; i++) {
      final dy = size.height / 5 * 4;
      final dx = 4 + (size.width - 8) * i;
      final oval = Rect.fromCircle(center: Offset(dx, dy), radius: 4);
      totalPath.arcTo(oval, pi / 2 + pi * i, pi, false);
    }
    canvas.drawPath(totalPath, totalPaint);

    final currPaint = Paint()..color = const Color(0xff191F40);
    final currPath = Path();

    for (int i = 0; i < 2; i++) {
      final dy = size.height / 5 * 4;
      final dx = 4 + step * ratio * i;
      currPos = Offset(dx, dy);
      final oval = Rect.fromCircle(center: Offset(dx, dy), radius: 4);
      currPath.arcTo(oval, pi / 2 + pi * i, pi, false);
    }

    canvas.drawPath(currPath, currPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
