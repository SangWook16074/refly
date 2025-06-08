import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/date/ui/viewModels/date_view_event.dart';
import 'package:solution_diary_app/src/feature/date/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/date/ui/widgets/expand_date_widget.dart';

class ExpandDateWidgetView extends HookConsumerWidget {
  const ExpandDateWidgetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 선택된 날짜
    final currDate = ref.watch(dateViewModelProvider);
    final viewModel = ref.read(dateViewModelProvider.notifier);
    final prev = useState<DateTime>(currDate);
    final size = MediaQuery.of(context).size;

    // 날짜 위젯 너비
    final totalItemWidth = (size.width - 16 * 6) / 6;

    final scrollController = useScrollController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final diff = prev.value.difference(currDate).inDays;
        if (diff == 0) return;
        log("${diff.toString()}일만큼 이동!");
        final currOffset = scrollController.offset;
        scrollController.animateTo(currOffset + diff * (totalItemWidth + 16),
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        prev.value = currDate;
      });

      return null;
    }, [currDate]);

    return NotificationListener<ScrollNotification>(
        child: ExpandDateWidget(
      controller: scrollController,
      onTap: (value) {
        /// 날짜를 탭하면
        /// 그 날짜로 날짜를 변경함.
        final newDate = value;
        viewModel.onEvent(SelectNewDate(newDate: newDate));
        prev.value = newDate;
      },
      onScroll: (value) {
        /// 날짜를 스와이프하면 가장 왼쪽에서 가까운 날짜로
        /// 날짜를 변경함.
        final newDate = value;
        viewModel.onEvent(SelectNewDate(newDate: newDate));
        prev.value = newDate;
      },
      currDate: currDate,
    ));
  }
}
