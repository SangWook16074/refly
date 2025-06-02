import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_error_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/progress_widget.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/state_detail_widget.dart';

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
          color: const Color(0xffffffff).withAlpha((255 * 0.25).round()),
          borderRadius: BorderRadius.circular(12.0)),
      alignment: Alignment.center,
      child: userStat.when(
          loading: () => const CircularProgressIndicator.adaptive(),
          error: (error, stackTrace) =>
              UserStateErrorView(error: error.toString()),
          data: (data) {
            final totalCount = data.total;
            final solveCount = data.solve;
            final unsolveCount = data.unsolve;
            log("$totalCount, $solveCount, $unsolveCount");
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
                                label: "진행중", count: unsolveCount)),
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
          }),
    );
  }
}
