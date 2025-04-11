import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/expand_date_widget.dart';

class ExpandDateWidgetView extends HookConsumerWidget {
  const ExpandDateWidgetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currDate = ref.watch(dateViewModelProvider);
    final controller = useScrollController();
    final userDragging = useState(false);
    final size = MediaQuery.of(context).size;
    final now = DateTime.now();
    const totalItemWidth = 66.0;
    // controller.addListener(onScrollEnd);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          // 사용자가 손으로 드래그 시작할 때
          if (notification.direction != ScrollDirection.idle) {
            userDragging.value = true;
          }
        }

        if (notification is ScrollEndNotification && userDragging.value) {
          userDragging.value = false;
          final offset = controller.offset;

          final index = offsetToIndex(offset, size.width, totalItemWidth);
          final targetOffset = indexToOffset(index, size.width, totalItemWidth);
          final clampedTarget =
              targetOffset.clamp(0.0, controller.position.maxScrollExtent);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.animateTo(
              clampedTarget,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
          // 날짜 갱신
          final selectedDate =
              DateTime.now().subtract(Duration(days: index - 5));
          ref
              .read(dateViewModelProvider.notifier)
              .setSelectedDate(selectedDate);
        }
        return false;
      },
      child: ExpandDateWidget(
        now: now,
        onTap: (value) {
          final newDate = value;
          ref.read(dateViewModelProvider.notifier).setSelectedDate(newDate);
          final index = dateToIndex(newDate);

          final targetOffset = indexToOffset(index + 5, size.width, 66);
          final clampedTarget =
              targetOffset.clamp(0.0, controller.position.maxScrollExtent);

          controller.animateTo(
            clampedTarget,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
        currDate: currDate,
        controller: controller,
      ),
    );
  }

  int dateToIndex(DateTime date) {
    final now = DateTime.now();
    return now.difference(date).inDays;
  }

  int offsetToIndex(double offset, double screenWidth, double itemWidth) {
    return ((offset + screenWidth - itemWidth) ~/ itemWidth);
  }

  double indexToOffset(int index, double screenWidth, double itemWidth) {
    return (index + 1) * itemWidth - screenWidth;
  }
}
