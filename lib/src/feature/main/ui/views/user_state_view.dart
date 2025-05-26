import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solution_diary_app/src/feature/main/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/main/ui/widgets/progress_widget.dart';
import 'package:solution_diary_app/src/feature/main/ui/widgets/state_detail_widget.dart';

class UserStateView extends StatelessWidget {
  final UserStat userStat;
  const UserStateView({super.key, required this.userStat});

  @override
  Widget build(BuildContext context) {
    final totalCount = userStat.total;
    final solveCount = userStat.solve;
    final unresolvedCount = totalCount - solveCount;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => context.go("/user"),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: StateDetailWidget(label: "전체", count: totalCount)),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                    child: StateDetailWidget(label: "완료", count: solveCount)),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                    child: StateDetailWidget(
                        label: "진행중", count: unresolvedCount)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProgressWidget(
                total: totalCount,
                current: solveCount,
                height: size.height / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
