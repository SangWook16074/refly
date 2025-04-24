import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/problem/model/problem_list_view_event.dart';
import 'package:solution_diary_app/src/ui/problem/view/empty_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_edit_sheet.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_focus_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_row.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_upload_fab_view.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_list_view_model.dart';

class ProblemListView extends ConsumerWidget {
  final List<Problem> problems;
  final bool showUploadFab;
  final String listId;
  const ProblemListView({
    super.key,
    this.showUploadFab = false,
    required this.problems,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final problemListViewModel =
        ref.read(problemListViewModelProvider(listId: listId).notifier);

    final GlobalKey listKey = GlobalKey();
    final List<GlobalKey> tileKeys =
        List.generate(problems.length, (index) => GlobalKey());

    if (problems.isEmpty) {
      return const EmptyView();
    }
    return Scaffold(
      floatingActionButton:
          (showUploadFab) ? const ProblemUploadFABView() : null,
      body: Stack(
        children: [
          ListView.separated(
              physics: const ClampingScrollPhysics(),
              key: listKey,
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
                      problemListViewModel.onEvent(
                          SelectProblem(index: index, problem: problem));
                    },
                    child: ProblemListRow(key: tileKey, problem: problem));
              }),
          ProblemListFocusView(
            problems: problems,
            tileKeys: tileKeys,
            listKey: listKey,
            listId: listId,
          ),
          ProblemEditSheet(
            listId: listId,
          ),
        ],
      ),
    );
  }
}
