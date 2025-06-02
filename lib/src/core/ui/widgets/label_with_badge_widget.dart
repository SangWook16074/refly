import 'package:flutter/material.dart';

class LabelWithBadgeWidget extends StatelessWidget {
  final String label;
  final int count;
  const LabelWithBadgeWidget(
      {super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        const SizedBox(
          width: 10,
        ),
        Badge.count(
          count: count,
        )
      ],
    );
  }
}
