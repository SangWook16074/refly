import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/user_stat_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/progress_widget.dart';
import 'package:solution_diary_app/src/ui/widgets/state_detail_widget.dart';

class UserStateView extends ConsumerWidget {
  final double height;
  const UserStateView({super.key, required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStat = ref.watch(userStatViewModelProvider);
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
          color: const Color(0xffffffff).withOpacity(.15),
          borderRadius: BorderRadius.circular(12.0)),
      alignment: Alignment.center,
      child: userStat.when(
          loading: () => const CircularProgressIndicator.adaptive(),
          error: (error, stackTrace) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.warning,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                  ),
                  Text(
                    "$error",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      color: Color(0xffffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          data: (data) {
            final totalCount = data.total;
            final solveCount = data.solve;
            final unresolvedCount = totalCount - solveCount;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: StateDetailWidget(
                              label: "전체", count: totalCount)),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                          child: StateDetailWidget(
                              label: "완료", count: solveCount)),
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
                  child: ProgressWidget(
                    total: totalCount,
                    current: solveCount,
                    height: height / 3,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
