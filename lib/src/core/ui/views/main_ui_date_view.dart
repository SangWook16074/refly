import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_view_model.dart';
import 'package:solution_diary_app/src/feature/date/ui/views/calendar_view.dart';
import 'package:solution_diary_app/src/feature/date/ui/views/date_view.dart';
import 'package:solution_diary_app/src/feature/date/ui/views/expand_date_widget_view.dart';

class MainUiDateView extends ConsumerWidget {
  const MainUiDateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity =
        ref.watch(mainUiViewModelProvider.select((it) => it.dateWidgetOpacity));

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: opacity > 0.99999 ? 0 : 1,
          child: const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 40, right: 16.0),
                child: DateView(),
              )),
        ),
        IgnorePointer(
          ignoring: opacity == 0,
          child: Opacity(
            opacity: opacity,
            child: const Column(
              children: [
                CalendarView(),
                ExpandDateWidgetView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
