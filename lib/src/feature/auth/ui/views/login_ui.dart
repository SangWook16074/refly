import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_state.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_view_model.dart';
import 'package:solution_diary_app/src/feature/auth/ui/views/login_button_view.dart';

class LoginUI extends ConsumerWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginUiState = ref.watch(loginUiViewModelProvider);
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: switch (loginUiState) {
          Progress() =>
            const Center(child: CircularProgressIndicator.adaptive()),
          _ => const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 7, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginButtonView(),
                        ],
                      )),
                ),
              ],
            ),
        });
  }
}
