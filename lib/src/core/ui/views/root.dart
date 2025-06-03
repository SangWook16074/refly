import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/auth/ui/views/login_ui.dart';
import 'package:solution_diary_app/src/core/ui/views/main_ui.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/auth_view_model.dart';

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (auth) {
          final session = auth.session;
          if (session != null) {
            return const MainUI();
          }
          return const LoginUI();
        },
        error: (error, trace) => const Scaffold(
              body: Center(
                child: Text("서버와의 상태가 불안정합니다."),
              ),
            ),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ));
  }
}
