import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/viewModel/user_problem_list_view_model.dart';
import 'package:solution_diary_app/src/ui/viewModel/user_view_model.dart';

class UserUI extends ConsumerWidget {
  const UserUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userViewModelProvider);
    final allProblems = ref.watch(userProblemListViewModelProvider);
    
    return const Scaffold(
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
