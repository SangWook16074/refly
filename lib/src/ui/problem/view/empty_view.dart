import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/problem/model/problem_view_event.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_upload_sheet.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/upload_button.dart';

class EmptyView extends ConsumerWidget with ShowProblemUploadSheetMixin {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
  }
}
