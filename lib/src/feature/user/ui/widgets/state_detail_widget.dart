import 'package:flutter/material.dart';

class StateDetailWidget extends StatelessWidget {
  final String label;
  final int count;
  const StateDetailWidget(
      {super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontFamily: "Roboto", fontSize: 10, color: Color(0xff223158)),
        ),
        Text(
          count.toString(),
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff223158),
          ),
        ),
      ],
    );
  }
}
