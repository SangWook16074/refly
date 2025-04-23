import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/problem/model/problem_list_view_event.dart';
import 'package:solution_diary_app/src/ui/problem/view/empty_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_edit_sheet.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_row.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_upload_fab_view.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_list_view_model.dart';

class ProblemListView extends ConsumerWidget {
  final List<Problem> problems;
  final bool showUploadFab;
  const ProblemListView(
      {super.key, this.showUploadFab = false, required this.problems});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final problemListViewState = ref.watch(problemListViewModelProvider);
    final problemListViewModel =
        ref.read(problemListViewModelProvider.notifier);
    final padding = MediaQuery.of(context).padding.bottom;
    final size = MediaQuery.of(context).size;

    final GlobalKey listKey = GlobalKey();
    final Map<int, GlobalKey> tileKeys = {};

    if (problems.isEmpty) {
      return const EmptyView();
    } else {
      return Scaffold(
        floatingActionButton: (showUploadFab)
            ? AnimatedOpacity(
                opacity: (problemListViewState.selectIndex == -1) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: const ProblemUploadFABView())
            : null,
        body: Stack(
          children: [
            ListView.separated(
                physics: const ClampingScrollPhysics(),
                key: listKey,
                padding: const EdgeInsets.symmetric(vertical: 20),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: problems.length,
                itemBuilder: (context, index) {
                  // 각 타일에 고유 키 넣기
                  tileKeys.putIfAbsent(index, () => GlobalKey());
                  final problem = problems[index];
                  return GestureDetector(
                      onLongPress: () {
                        problemListViewModel.onEvent(
                            SelectProblem(index: index, problem: problem));
                      },
                      child: ProblemListRow(
                          key: tileKeys[index], problem: problem));
                }),
            if (problemListViewState.selectIndex != -1)
              // barrier layer
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final tileKey = tileKeys[problemListViewState.selectIndex]!;
                    final listBox = listKey.currentContext?.findRenderObject()
                        as RenderBox?;
                    final tileBox = tileKey.currentContext?.findRenderObject()
                        as RenderBox?;

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
                                  problem: problems[
                                      problemListViewState.selectIndex],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            AnimatedPositioned(
                bottom: problemListViewState.showSheet ? padding + 20 : -300,
                width: size.width,
                duration: const Duration(milliseconds: 300),
                child: const ProblemEditSheet()),
          ],
        ),
      );
    }
  }
}
