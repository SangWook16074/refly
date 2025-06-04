import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_error_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/state_detail_widget.dart';

class UserStatView extends ConsumerWidget {
  final bool isLarge;
  const UserStatView({super.key, this.isLarge = false});

  const UserStatView.large({super.key, this.isLarge = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStat = ref.watch(userStatViewModelProvider);
    return userStat.when(data: (UserStat data) {
      final totalCount = data.total;
      final solveCount = data.solve;
      final unsolveCount = data.unsolve;
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: isLarge
              ? [
                  StateDetailWidget.large(label: "전체기록", count: totalCount),
                  StateDetailWidget.large(label: "해결중", count: unsolveCount),
                  StateDetailWidget.large(label: "해결완료", count: solveCount),
                ]
              : [
                  StateDetailWidget(label: "전체기록", count: totalCount),
                  StateDetailWidget(label: "해결중", count: unsolveCount),
                  StateDetailWidget(label: "해결완료", count: solveCount),
                ]);
    }, error: (Object error, StackTrace stackTrace) {
      return UserStateErrorView(error: error.toString());
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
