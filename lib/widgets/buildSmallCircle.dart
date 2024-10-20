import 'package:flutter/material.dart';
import 'dart:math'; // 수학적 계산을 위한 패키지

class SmallCircle extends StatelessWidget {
  final int index;
  final int totalCircles;
  final double radius;

  const SmallCircle({
    Key? key,
    required this.index,
    required this.totalCircles,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 각 원의 각도를 계산 (360도를 totalCircles로 나눔)
    double angle = (2 * pi / totalCircles) * index;
    double x = radius * cos(angle); // x 좌표
    double y = radius * sin(angle); // y 좌표

    double size = (index % 10 == 0) ? 9.0 : 3.0;

    return Transform.translate(
      offset: Offset(x, y),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
