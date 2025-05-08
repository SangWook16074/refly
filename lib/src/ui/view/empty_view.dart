import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';
import 'package:solution_diary_app/src/ui/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/upload_button.dart';

class EmptyView extends ConsumerWidget with ShowProblemUploadSheetMixin {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateState = ref.watch(dateViewModelProvider);
    final now = DateTime.now();
    if (dateState.year == now.year &&
        dateState.month == now.month &&
        dateState.day == now.day) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "해결과정을 기록하면 성장할 수 있어요!\n오늘 생긴 궁금증을 적어볼까요?",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () => showProblemAddSheet(context),
                child: const UploadButton())
          ],
        ),
      );
    } else {
      return const Center(
        child: Text(
          "아무 기록도 등록되지 않았어요.",
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
