import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/progress_widget.dart';

class UserResolutionRateProgressView extends ConsumerWidget {
  const UserResolutionRateProgressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStat = ref.watch(userStatViewModelProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return userStat.when(
        data: (UserStat data) {
          final totalCount = data.total;
          final solveCount = data.solve;
          return ProgressWidget(
            width: constraints.maxWidth,
            total: totalCount,
            current: solveCount,
          );
        },
        error: (error, stackTrace) {
          return ProgressWidget(
            width: constraints.maxWidth,
            total: 0,
            current: 0,
          );
        },
        loading: () {
          return ProgressWidget(
            width: constraints.maxWidth,
            total: 0,
            current: 0,
          );
        },
      );
    });
  }
}
