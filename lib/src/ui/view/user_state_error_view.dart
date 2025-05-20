import 'package:flutter/material.dart';

class UserStateErrorView extends StatelessWidget {
  final String error;
  const UserStateErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.warning,
            color: Color(0xffffffff),
            size: 30,
          ),
        ),
        Text(
          error,
          style: const TextStyle(
            fontFamily: "Roboto",
            color: Color(0xffffffff),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
