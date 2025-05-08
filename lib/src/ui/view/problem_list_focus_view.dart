import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/model/problem_list_view_event.dart';
import 'package:solution_diary_app/src/ui/view/problem_list_row.dart';
import 'package:solution_diary_app/src/ui/viewModel/problem_list_view_model.dart';

class ProblemListFocusView extends ConsumerWidget {
  final List<Problem> problems;
  final List<GlobalKey> tileKeys;
  final GlobalKey listKey;
  final String listId;
  const ProblemListFocusView({
    super.key,
    required this.problems,
    required this.tileKeys,
    required this.listKey,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectIndex =
        ref.watch(problemListViewModelProvider.select((it) => it.selectIndex));
    final problemListViewModel =
        ref.read(problemListViewModelProvider.notifier);

    if (selectIndex == -1) {
      return Container();
    }

    // barrier layer
    return Positioned.fill(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tileKey = tileKeys[selectIndex];
          final listBox =
              listKey.currentContext?.findRenderObject() as RenderBox?;
          final tileBox =
              tileKey.currentContext?.findRenderObject() as RenderBox?;

          if (listBox == null || tileBox == null)
            return const SizedBox.shrink();

          final tileOffset = tileBox.localToGlobal(Offset.zero);
          final listOffset = listBox.localToGlobal(Offset.zero);
          final relativeOffset = tileOffset - listOffset;
          final size = tileBox.size;

          return Stack(
            children: [
              // 전체 반투명 barrier
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: ModalBarrier(
                  onDismiss: () {
                    problemListViewModel.onEvent(UnselectProblem());
                  },
                  color: const Color(0xffdbdbdb).withOpacity(0.2),
                ),
              ),

              // 타일 위치만 잘라내기 (Spotlight 효과)
              Positioned(
                top: relativeOffset.dy,
                left: relativeOffset.dx,
                width: size.width,
                height: size.height,
                child: IgnorePointer(
                  child: Column(
                    children: [
                      ProblemListRow(
                        key: UniqueKey(), // 재사용 방지
                        problem: problems[selectIndex],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
