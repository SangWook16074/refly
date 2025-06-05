import 'package:flutter/material.dart';

class ProblemStatusWidget extends StatelessWidget {
  final bool isDone;
  const ProblemStatusWidget({super.key, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: (isDone) ? const Color(0xff57D364) : const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
