import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/data/dtos/problem_response_dto.dart';
import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/empty_view.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/problem_edit_sheet.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/problem_list_focus_view.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/problem_list_view.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/problem_upload_fab_view.dart';

class FocusableListView extends ConsumerWidget {
  final List<ProblemModel> problems;
  final bool showUploadFab;
  final String listId;
  const FocusableListView({
    super.key,
    this.showUploadFab = false,
    required this.problems,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          DailyProblemListView(
            key: listKey,
            problems: problems,
            tileKeys: tileKeys,
            listId: listId,
          ),
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
