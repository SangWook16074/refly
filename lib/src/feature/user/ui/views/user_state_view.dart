import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_image_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_login_provider_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_error_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/state_detail_widget.dart';

class UserStatView extends ConsumerWidget {
  const UserStatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userStat = ref.watch(userStatViewModelProvider);
    return userStat.when(data: (UserStat data) {
      final totalCount = data.total;
      final solveCount = data.solve;
      final unsolveCount = data.unsolve;
      return Container(
        constraints: const BoxConstraints(maxHeight: 130),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: const Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50, child: UserImageView()),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "한상욱",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const UserLoginProviderView()
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StateDetailWidget(label: "전체기록", count: totalCount),
                StateDetailWidget(label: "해결중", count: unsolveCount),
                StateDetailWidget(label: "해결완료", count: solveCount),
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
