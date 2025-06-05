import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/daily_problem_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/empty_view.dart';
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

    showUpdateConfirmDialog(int id) {
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "해당 기록을 수정할까요?",
                onConfirm: () {},
              ));
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
