import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/expand_date_widget.dart';

class ExpandDateWidgetView extends ConsumerWidget {
  const ExpandDateWidgetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 선택된 날짜
    final currDate = ref.watch(dateViewModelProvider);

    return NotificationListener<ScrollNotification>(
        child: ExpandDateWidget(
      onTap: (value) {
        final newDate = value;
        ref.read(dateViewModelProvider.notifier).setSelectedDate(newDate);
      },
      onScroll: (value) {
        final newDate = value;
        ref.read(dateViewModelProvider.notifier).setSelectedDate(newDate);
      },
      currDate: currDate,
    ));
  }
}
