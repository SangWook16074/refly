import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  final String hintText;

  CustomTextField({
    super.key,
    super.controller,
    super.maxLines,
    super.onChanged,
    required this.hintText,
  }) : super(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontFamily: "Roboto", fontSize: 15, color: Color(0xffafafaf)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(width: 1.0, color: Color(0xffacacac))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(width: 1.0, color: Color(0xffcccccc)))),
        );
}
