import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/label_with_badge_widget.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/user_all_problem_list_view_model.dart';

class UserProblemListTabView extends ConsumerWidget {
  const UserProblemListTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final problems = ref.watch(userAllProblemListViewModelProvider);
    return TabBar(
        indicatorColor: theme.colorScheme.primary,
        labelStyle: const TextStyle(color: Color(0xff000000)),
        unselectedLabelStyle: TextStyle(
            color: const Color(0xff000000).withAlpha((255.0 * 0.6).round())),
        tabs: const [
          Tab(child: LabelWithBadgeWidget(label: "진행중", count: 0)),
          Tab(child: LabelWithBadgeWidget(label: "해결완료", count: 0)),
        ]);
  }
}
