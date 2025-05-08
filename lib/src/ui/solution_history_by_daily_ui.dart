import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/view/focusable_list_view.dart';
import 'package:solution_diary_app/src/ui/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/viewModel/problem_view_model.dart';

class SolutionHistoryByDailyUI extends ConsumerWidget {
  const SolutionHistoryByDailyUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(dateViewModelProvider);
    final state = ref.watch(dailyProblemViewModelProvider(target: now));
    return Scaffold(
      body: switch (state) {
        AsyncError() => const Center(
            child: Text("에러가 발생했습니다!"),
          ),
        AsyncData(:final value) => FocusableListView(
            problems: value, showUploadFab: true, listId: "solved"),
        _ => const Center(
            child: CircularProgressIndicator.adaptive(),
          )
      },
    );
  }
}
