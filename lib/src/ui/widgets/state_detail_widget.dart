import 'package:flutter/material.dart';

class StateDetailWidget extends StatelessWidget {
  final String label;
  final int count;
  const StateDetailWidget(
      {super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontFamily: "Roboto", fontSize: 15, color: Color(0xff223158)),
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Color(0xff223158),
            ),
          ),
        ],
      ),
    );
  }
}
