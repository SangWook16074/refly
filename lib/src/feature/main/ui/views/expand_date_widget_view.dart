import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/date_view_event.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/widgets/expand_date_widget.dart';

class ExpandDateWidgetView extends ConsumerWidget {
  const ExpandDateWidgetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 선택된 날짜
    final currDate = ref.watch(dateViewModelProvider);
    final viewModel = ref.read(dateViewModelProvider.notifier);

    return NotificationListener<ScrollNotification>(
        child: ExpandDateWidget(
      onTap: (value) {
        /// 날짜를 탭하면
        /// 그 날짜로 날짜를 변경함.
        final newDate = value;
        viewModel.onEvent(SelectNewDate(newDate: newDate));
      },
      onScroll: (value) {
        /// 날짜를 스와이프하면 가장 왼쪽에서 가까운 날짜로
        /// 날짜를 변경함.
        final newDate = value;
        viewModel.onEvent(SelectNewDate(newDate: newDate));
      },
      currDate: currDate,
    ));
  }
}
