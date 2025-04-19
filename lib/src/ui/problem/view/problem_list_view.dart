import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/problem/view/empty_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_detail_sheet.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_row.dart';
import 'package:solution_diary_app/src/ui/widgets/problem_add_row_button.dart';

class ProblemListView extends StatelessWidget {
  final List<Problem> problems;
  const ProblemListView({super.key, required this.problems});

  @override
  Widget build(BuildContext context) {
    void showProblemDetailSheet(Problem problem) {
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
          builder: (context) => ProblemDetailSheet(
                problem: problem,
              ));
    }

    if (problems.isEmpty) {
      return const EmptyView();
    } else {
      return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20),
          separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
          itemCount: problems.length,
          itemBuilder: (context, index) {
            final problem = problems[index];
            return ProblemListRow(problem: problem);
          });
    }
  }
}
