import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  const CustomTextField(
      {super.key, this.controller, required this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      showCursor: false,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontFamily: "Roboto", fontSize: 13, color: Color(0xffacacac)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(width: 1.0, color: Color(0xff707070))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(width: 1.0, color: Color(0xffacacac)))),
    );
  }
}
