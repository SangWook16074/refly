import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_list_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/problem_list_row.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_list_view_model.dart';

class ProblemListView extends ConsumerWidget {
  final List<ProblemModel> problems;
  final List<GlobalKey> tileKeys;
  final String listId;

  const ProblemListView(
      {super.key,
      required this.problems,
      required this.tileKeys,
      required this.listId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final problemListViewModel =
        ref.read(problemListViewModelProvider.notifier);
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.only(top: 20, bottom: 150),
        separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
        itemCount: problems.length,
        itemBuilder: (context, index) {
          // 각 타일에 고유 키 넣기
          final tileKey = tileKeys[index];
          final problem = problems[index];
          return GestureDetector(
              onLongPress: () {
                problemListViewModel
                    .onEvent(SelectProblem(index: index, problem: problem));
              },
              child: ProblemListRow(key: tileKey, problem: problem));
        });
  }
}
