import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solution_diary_app/src/feature/date/ui/widgets/date_widget.dart';

class ExpandDateWidget extends HookWidget {
  final DateTime currDate;

  final ValueSetter<DateTime> onTap;
  final ValueSetter<DateTime> onScroll;
  final ScrollController? controller;
  const ExpandDateWidget({
    super.key,
    required this.currDate,
    required this.onTap,
    required this.onScroll,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    const totalDays = 10000;
    final size = MediaQuery.of(context).size;

    // 날짜 위젯 너비
    final totalItemWidth = (size.width - 16 * 6) / 6;
    // 사용자 드래그 상태
    final userDragging = useState(false);

    // 사용자의 재스크롤 판정 타이머
    final debounceTimer = useRef<Timer?>(null);

    final controller = this.controller ?? useScrollController();

    final dateHistory = useState(now);

    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          final offset = controller.offset;
          final maxExtent = controller.position.maxScrollExtent;
          final index = offsetToIndex(offset, maxExtent);
          // 날짜 갱신
          dateHistory.value = now.subtract(Duration(days: index));

          // // 스크롤이 시작되면 userDragging이 활성화
          // // 타이머 초기화
          if (notification is UserScrollNotification &&
              notification.direction != ScrollDirection.idle) {
            debounceTimer.value?.cancel();
          }

          if (notification is UserScrollNotification &&
              notification.direction == ScrollDirection.idle) {
            // 타이머 초기화
            debounceTimer.value?.cancel();

            // 150ms후에 아무런 이벤트도 없다면
            // 기준점(가장 오른쪽 날짜 위치 기준)으로 부터 가장 가까운 날짜로 갱신
            debounceTimer.value =
                Timer(const Duration(milliseconds: 150), () async {
              final index = offsetToIndex(offset, maxExtent);

              controller.animateTo(
                indexToOffset(index, totalItemWidth + 16),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );

              // 날짜 갱신
              final selectedDate = start.subtract(Duration(days: index));
              onScroll(selectedDate);
              dateHistory.value = selectedDate;
              userDragging.value = false;
            });
          }
          return false;
        },
        child: SizedBox(
          height: (size.width - 16 * 6) / 6,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              itemCount: totalDays,
              itemBuilder: (context, index) {
                final date = start.subtract(Duration(days: index));
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      controller
                          .animateTo(
                        indexToOffset(index, totalItemWidth + 16),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      )
                          .whenComplete(() {
                        dateHistory.value = date;
                        onTap(dateHistory.value);
                      });
                    },
                    child: DateWidget(
                      date: date,
                      type: DateUtils.isSameDay(date, currDate)
                          ? SelectType.select
                          : SelectType.unselect,
                    ),
                  ),
                );
              }),
        ));
  }

  int offsetToIndex(
    double offset,
    double maxExtent,
  ) {
    return (10000 * offset ~/ maxExtent);
  }

  double indexToOffset(int index, double itemWidth) {
    return itemWidth * index;
  }
}
