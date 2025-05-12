import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/providers/auth_service_provider.dart';
import 'package:solution_diary_app/src/ui/login_ui.dart';
import 'package:solution_diary_app/src/ui/main_ui.dart';
import 'package:solution_diary_app/src/ui/viewModel/auth_view_model.dart';

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
            // return Scaffold(
            //   body: Center(
            //     child: ElevatedButton(
            //         onPressed: () {
            //           ref.read(authServiceProvider).signOut();
            //         },
            //         child: const Text("로그아웃")),
            //   ),
            // );
          } else {
            return const LoginUI();
          }
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
