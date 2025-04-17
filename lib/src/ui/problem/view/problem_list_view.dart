import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/problem/view/empty_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_row.dart';
import 'package:solution_diary_app/src/ui/widgets/problem_add_row_widget.dart';

class ProblemListView extends StatelessWidget {
  final List<Problem> problems;
  const ProblemListView({super.key, required this.problems});

  @override
  Widget build(BuildContext context) {
    if (problems.isEmpty) {
      return const EmptyView();
    } else {
      return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20),
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: problems.length + 1,
          itemBuilder: (context, index) {
            if (index == problems.length) {
              return const ProblemAddRowWidget();
            }

            final problem = problems[index];
            return ProblemListRow(problem: problem);
          });
    }
  }
}
