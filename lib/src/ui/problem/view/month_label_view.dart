import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/extensions/date_extension.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/date_view_model.dart';

class MonthLabelView extends ConsumerWidget {
  const MonthLabelView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currDate = ref.watch(dateViewModelProvider);

    return Text(currDate.monthLabel);
  }
}
