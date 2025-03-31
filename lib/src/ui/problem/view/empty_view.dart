import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "해결과정을 기록하면 성장할 수 있어요!\n오늘 생긴 궁금증을 적어볼까요?",
      textAlign: TextAlign.center,
    ));
  }
}
