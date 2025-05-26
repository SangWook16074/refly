import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/focusable_list_view.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/unresolved_problem_view_model.dart';

class UnresolvedHistoryUI extends ConsumerWidget {
  const UnresolvedHistoryUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(unresolvedProblemViewModelProvider);
    return switch (state) {
      AsyncError() => const Center(
          child: Text("에러가 발생했습니다!"),
        ),
      AsyncData(:final value) => FocusableListView(
          problems: value.where((it) => !it.isDone).toList(),
          listId: "unsolved",
        ),
      _ => const Center(
          child: CircularProgressIndicator.adaptive(),
        )
    };
  }
}
