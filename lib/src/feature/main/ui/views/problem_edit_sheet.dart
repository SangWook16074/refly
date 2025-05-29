import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/problem_list_view_event.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/problem_view_event.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/problem_list_view_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/daily_problem_view_model.dart';
import 'package:solution_diary_app/src/core/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/user_stat_view_event.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/user_stat_view_model.dart';

class ProblemEditSheet extends ConsumerWidget {
  final String listId;
  const ProblemEditSheet({super.key, required this.listId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(dateViewModelProvider);
    final problemListViewState = ref.watch(problemListViewModelProvider);
    final problemListViewModel =
        ref.read(problemListViewModelProvider.notifier);
    final problemViewModel =
        ref.read(DailyProblemViewModelProvider(target: now).notifier);
    final userStatViewModel = ref.read(userStatViewModelProvider.notifier);
    final padding = MediaQuery.of(context).padding.bottom;
    final size = MediaQuery.of(context).size;
    showDeleteConfirmDialog() {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해당 기록을 정말로 삭제할까요?",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await problemViewModel.onEvent(
                      DeleteProblem(id: problemListViewState.problem!.id!));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              ));
    }

    showUpdateConfirmDialog() {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해당 기록을 수정할까요?",
                onConfirm: () {},
              ));
    }

    return AnimatedPositioned(
      bottom: problemListViewState.showSheet ? padding + 20 : -300,
      width: size.width,
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: const Color(0xff000000).withOpacity(.04))
            ],
            color: const Color(0xffffffff),
            border: Border.all(width: 0.5, color: const Color(0xffdfdfdf)),
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                problemListViewModel.onEvent(OpenProblemEditDialog());
                showUpdateConfirmDialog();
              },
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "수정하기",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Color(0xffdfdfdf),
            ),
            GestureDetector(
              onTap: () {
                problemListViewModel.onEvent(OpenProblemEditDialog());
                showDeleteConfirmDialog();
              },
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "삭제하기",
                      // selectionColor: Color(0xffff0000),
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffff0000)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
