import 'package:flutter/material.dart';

class StateDetailWidget extends StatelessWidget {
  final String label;
  final int count;
  final TextStyle? labelStyle;
  final TextStyle? countStyle;
  const StateDetailWidget({
    super.key,
    required this.label,
    required this.count,
    this.labelStyle = const TextStyle(
        fontFamily: "Roboto", fontSize: 10, color: Color(0xff191F40)),
    this.countStyle = const TextStyle(
      fontFamily: "Roboto",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color(0xff191F40),
    ),
  });

  const StateDetailWidget.large({
    super.key,
    required this.label,
    required this.count,
    this.labelStyle = const TextStyle(
        fontFamily: "Roboto", fontSize: 15, color: Color(0xff191F40)),
    this.countStyle = const TextStyle(
      fontFamily: "Roboto",
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Color(0xff191F40),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        Text(
          count.toString(),
          style: countStyle,
        ),
      ],
    );
  }
}
