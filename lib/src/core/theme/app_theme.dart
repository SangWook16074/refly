import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: const Color(0xffE9EAEF),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Color(0xff000025)),
  colorScheme: const ColorScheme.light(
      primary: Color(0xff000025),
      secondary: Color(0xff191F40),
      tertiary: Color(0xff3C518A)),
);
