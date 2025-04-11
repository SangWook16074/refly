import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/core/theme/app_theme.dart';
import 'package:solution_diary_app/src/ui/main_ui.dart';
import 'package:solution_diary_app/src/ui/problem/view/user_state_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: const MainUI());
  }
}
