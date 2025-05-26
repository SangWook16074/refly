import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/user_state_view.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/user_state_error_view.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/user_stat_view_model.dart';

class UserStateUI extends ConsumerWidget {
  const UserStateUI({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStat = ref.watch(userStatViewModelProvider);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
          color: const Color(0xffffffff).withOpacity(.15),
          borderRadius: BorderRadius.circular(12.0)),
      alignment: Alignment.center,
      child: userStat.when(
          loading: () => const CircularProgressIndicator.adaptive(),
          error: (error, stackTrace) =>
              UserStateErrorView(error: error.toString()),
          data: (data) {
            return UserStateView(userStat: data);
          }),
    );
  }
}
