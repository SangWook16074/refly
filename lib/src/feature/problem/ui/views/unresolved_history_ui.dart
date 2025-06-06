import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/user_problem_list_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/user_problem_list_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/problem_update_sheet.dart';
import 'package:solution_diary_app/src/feature/problem/ui/widgets/problem_list_widget.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_event.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';

class UnresolvedHistoryUI extends ConsumerWidget {
  const UnresolvedHistoryUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProblemListViewModelProvider);
    final viewModel = ref.read(userProblemListViewModelProvider.notifier);
    final userStatViewModel = ref.read(userStatViewModelProvider.notifier);

    showDeleteConfirmDialog(int id) {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해당 기록을 정말로 삭제할까요?",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await viewModel
                      .onEvent(UserProblemListViewEvent.delete(id: id));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              ));
    }

    void onUpdateTap(ProblemModel problem) {
      viewModel.onEvent(UserProblemListViewEvent.update(problem: problem));
    }

    void showUpdateBottomSheet(ProblemModel problem) {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          context: context,
          elevation: 0.0,
          useSafeArea: true,
          enableDrag: true,
          backgroundColor: Colors.transparent,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => ProblemUpdateSheet(
                problem: problem,
                onUpdateTap: onUpdateTap,
              ));
    }

    showUpdateConfirmDialog(ProblemModel problem) {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해당 기록을 수정할까요?",
                onConfirm: () {
                  Navigator.of(context);
                  showUpdateBottomSheet(problem);
                },
              ));
    }

    void showOnTrailingDialog(ProblemModel problem) {
      showDialog(
          context: context,
          barrierColor: const Color.fromARGB(255, 9, 9, 9).withOpacity(.1),
          builder: (context) {
            if (problem.isDone) {
              return CustomDialog(
                content: "문제 해결을 취소할까요?",
                confirmLabel: "네",
                cancelLabel: "아니요",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await viewModel.onEvent(UserProblemListViewEvent.update(
                      problem: problem.copyWith(isDone: false)));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              );
            } else {
              return CustomDialog(
                content: "문제를 해결처리할까요?",
                confirmLabel: "네",
                cancelLabel: "아니요",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await viewModel.onEvent(UserProblemListViewEvent.update(
                      problem: problem.copyWith(isDone: true)));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              );
            }
          });
    }

    void onItemPrefix(ProblemModel problem) {
      viewModel.onEvent(UserProblemListViewEvent.update(
          problem: problem.copyWith(isFavorite: !problem.isFavorite)));
    }

    return switch (state) {
      AsyncError() => const Center(
          child: Text("에러가 발생했습니다!"),
        ),
      AsyncData(:final value) => ProblemListWidget(
          problems: value.where((it) => !it.isDone).toList(),
          onItemEdit: showUpdateConfirmDialog,
          onItemDelete: showDeleteConfirmDialog,
          onItemTrailing: showOnTrailingDialog,
          onItemPrefix: onItemPrefix,
          physics: const NeverScrollableScrollPhysics(),
        ),
      _ => const Center(
          child: CircularProgressIndicator.adaptive(),
        )
    };
  }
}
