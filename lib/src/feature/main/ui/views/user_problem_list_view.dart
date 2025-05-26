import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/user_problem_list_view_model.dart';

class UserProblemListView extends ConsumerWidget {
  const UserProblemListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProblems = ref.watch(userProblemListViewModelProvider);
    return switch (userProblems) {
      AsyncValue<List<ProblemModel>>() => throw UnimplementedError(),
    };
  }
}
