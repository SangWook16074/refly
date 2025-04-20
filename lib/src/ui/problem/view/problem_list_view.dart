import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/ui/problem/view/empty_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_list_row.dart';

class ProblemListView extends HookWidget {
  final List<Problem> problems;
  const ProblemListView({super.key, required this.problems});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int?>(null);

    showUpdateOrDeleteDialog() {}

    final GlobalKey listKey = GlobalKey();
    final Map<int, GlobalKey> tileKeys = {};

    if (problems.isEmpty) {
      return const EmptyView();
    } else {
      return Stack(
        children: [
          ListView.separated(
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
                      selectedIndex.value = index;
                      showUpdateOrDeleteDialog();
                    },
                    child:
                        ProblemListRow(key: tileKeys[index], problem: problem));
              }),
          if (selectedIndex.value != null)
            // barrier layer
            Positioned.fill(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final tileKey = tileKeys[selectedIndex.value]!;
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
                            selectedIndex.value = null;
                          },
                          color: const Color(0xffdbdbdb).withOpacity(0.2),
                        ),
                      ),

                      // 타일 위치만 잘라내기 (Spotlight 효과)
                      Positioned(
                        top: relativeOffset.dy,
                        left: relativeOffset.dx,
                        width: size.width,
                        height: size.height + 200,
                        child: IgnorePointer(
                          child: Column(
                            children: [
                              ProblemListRow(
                                key: UniqueKey(), // 재사용 방지
                                problem: problems[selectedIndex.value!],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 4),
                                          blurRadius: 4,
                                          color: const Color(0xff000000)
                                              .withOpacity(.04))
                                    ],
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "수정하기",
                                        style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "삭제하기",
                                        // selectionColor: Color(0xffff0000),
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffff0000)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      );
    }
  }
}
