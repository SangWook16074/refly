import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/user_all_problem_list_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/focusable_list_view.dart';

class SolvedHistoryUI extends ConsumerWidget {
  const SolvedHistoryUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userAllProblemListViewModelProvider);
    return switch (state) {
      AsyncError() => const Center(
          child: Text("에러가 발생했습니다!"),
        ),
      AsyncData(:final value) => FocusableListView(
          problems: value.problems.where((it) => it.isDone).toList(),
          listId: "unsolved",
        ),
      _ => const Center(
          child: CircularProgressIndicator.adaptive(),
        )
    };
  }
}
