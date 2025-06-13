import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/date/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/daily_problem_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/empty_view.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/problem_complete_upload_sheet.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/problem_update_sheet.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/problem_upload_fab_view.dart';
import 'package:solution_diary_app/src/feature/problem/ui/widgets/problem_list_widget.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_event.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';

class SolutionHistoryByDailyUI extends ConsumerWidget {
  const SolutionHistoryByDailyUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(dateViewModelProvider);
    final provider = dailyProblemViewModelProvider(target: now);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final userStatViewModel = ref.read(userStatViewModelProvider.notifier);

    showDeleteConfirmDialog(int id) {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해당 기록을 정말로 삭제할까요?",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await viewModel.onEvent(DeleteProblem(id: id));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              ));
    }

    void onUpdateTap(ProblemModel problem) {
      viewModel.onEvent(UpdateProblem(problem: problem));
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
                  Navigator.of(context).pop();
                  showUpdateBottomSheet(problem);
                },
              ));
    }

    void onCompleteTap(ProblemModel problem) {
      viewModel.onEvent(UpdateProblem(problem: problem));
    }

    void showProblemCompleteUploadBottomSheet(ProblemModel problem) {
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
          builder: (context) => ProblemCompleteUploadSheet(
                problem: problem,
                onCompleteTap: onCompleteTap,
              ));
    }

    void showProblemCompleteUploadConfirmDialog(ProblemModel problem) {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해결책을 함께 등록하시겠어요?",
                confirmLabel: "네",
                cancelLabel: "아니요",
                onConfirm: () {
                  Navigator.of(context).pop();
                  showProblemCompleteUploadBottomSheet(problem);
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
                content: "문제 해결을 취소할까요?\n등록된 해결책도 함께 사라집니다.",
                confirmLabel: "네",
                cancelLabel: "아니요",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await viewModel.onEvent(UpdateProblem(
                      problem: problem.copyWith(isDone: false, solution: "")));
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
                  final newProblem = problem.copyWith(isDone: true);
                  await viewModel.onEvent(UpdateProblem(problem: newProblem));
                  userStatViewModel.onEvent(RefreshUserStat());
                  showProblemCompleteUploadConfirmDialog(newProblem);
                },
              );
            }
          });
    }

    void onItemPrefix(ProblemModel problem) {
      viewModel.onEvent(UpdateProblem(
          problem: problem.copyWith(isFavorite: !problem.isFavorite)));
    }

    return Scaffold(
      floatingActionButton: const ProblemUploadFABView(),
      body: switch (state) {
        AsyncError() => const Center(
            child: Text("에러가 발생했습니다!"),
          ),
        AsyncData(:final List<ProblemModel> value) => value.isNotEmpty
            ? ProblemListWidget(
                problems: value,
                onItemEdit: showUpdateConfirmDialog,
                onItemDelete: showDeleteConfirmDialog,
                onItemTrailing: showOnTrailingDialog,
                onItemPrefix: onItemPrefix,
              )
            : const EmptyView(),
        // FocusableListView(
        //     problems: value, showUploadFab: true, listId: "solved"),
        _ => const Center(
            child: CircularProgressIndicator.adaptive(),
          )
      },
    );
  }
}
