import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';

class UserResolutionRateView extends ConsumerWidget {
  const UserResolutionRateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStat = ref.watch(userStatViewModelProvider);

    return userStat.when(data: (UserStat data) {
      final rate = data.userResolutionRate;

      return Text(
        "$rate%",
        style: const TextStyle(
            color: Color(0xff191F40),
            fontSize: 30,
            fontWeight: FontWeight.w600),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Container();
    }, loading: () {
      return Container();
    });
  }
}
