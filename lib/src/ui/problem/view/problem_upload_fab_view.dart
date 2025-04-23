import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';
import 'dart:math';

extension on DateTime {
  bool isEqualTo(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}

class ProblemUploadFABView extends ConsumerWidget
    with ShowProblemUploadSheetMixin {
  const ProblemUploadFABView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateState = ref.watch(dateViewModelProvider.select((it) => it));
    final asyncState = ref.watch(problemViewModelProvider);
    return asyncState.when(
        data: (state) =>
            (state.isNotEmpty && dateState.isEqualTo(DateTime.now()))
                ? FloatingActionButton(
                    onPressed: () => showProblemAddSheet(context),
                    child: Transform.rotate(
                      angle: pi / 4,
                      child: const Icon(
                        Icons.close,
                        color: Color(0xffffffff),
                        size: 30,
                      ),
                    ))
                : Container(),
        error: (error, stacktrace) => Container(),
        loading: () => Container());
  }
}
