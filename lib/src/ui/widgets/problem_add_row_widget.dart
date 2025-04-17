import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';

import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';

class ProblemAddRowWidget extends ConsumerWidget
    with ShowProblemUploadSheetMixin {
  const ProblemAddRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => showProblemAddSheet(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: const Color(0xff000000).withOpacity(.04))
            ]),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Color(0xffBDBDBD),
        ),
      ),
    );
  }
}
