import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/ui/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/date_widget.dart';

class DateView extends ConsumerWidget {
  const DateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currDate = ref.watch(dateViewModelProvider.select((it) => it));
    return DateWidget(
      date: currDate,
    );
  }
}
