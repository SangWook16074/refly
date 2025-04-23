import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_view.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';

class SolutionHistoryByDailyUI extends ConsumerWidget {
  const SolutionHistoryByDailyUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(problemViewModelProvider);
    return Scaffold(
      body: switch (state) {
        AsyncError() => const Center(
            child: Text("에러가 발생했습니다!"),
          ),
        AsyncData(:final value) => ProblemListView(
            problems: value,
            showUploadFab: true,
          ),
        _ => const Center(
            child: CircularProgressIndicator.adaptive(),
          )
      },
    );
  }
}
