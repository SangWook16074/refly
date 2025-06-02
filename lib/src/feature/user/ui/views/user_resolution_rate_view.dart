import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_error_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/progress_widget.dart';

class UserResolutionRateView extends ConsumerWidget {
  const UserResolutionRateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStat = ref.watch(userStatViewModelProvider);

    return userStat.when(data: (UserStat data) {
      final totalCount = data.total;
      final solveCount = data.solve;

      return Container(
        constraints: const BoxConstraints(maxHeight: 130),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: const Color(0xfff3f3f3),
            borderRadius: BorderRadius.circular(8.0)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "문제 해결률",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff3C518A),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${(solveCount / totalCount * 100).round()}%",
                  style: const TextStyle(
                      color: Color(0xff3C518A),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 3,
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return ProgressWidget(
                    width: constraints.maxWidth,
                    total: totalCount,
                    current: solveCount,
                  );
                }),
              ],
            ),
          ],
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return UserStateErrorView(error: error.toString());
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
