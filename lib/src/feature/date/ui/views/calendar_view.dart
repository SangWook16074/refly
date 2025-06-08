import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/edit_sheet_widget.dart';
import 'package:solution_diary_app/src/feature/date/ui/viewModels/date_view_event.dart';
import 'package:solution_diary_app/src/feature/date/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/date/ui/widgets/calendar_widget.dart';
import 'package:solution_diary_app/src/feature/date/ui/widgets/date_select_button.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currDate = ref.watch(dateViewModelProvider);
    final viewModel = ref.read(dateViewModelProvider.notifier);
    final calendarOverlay = useState<OverlayEntry?>(null);
    final newDate = useState<DateTime?>(null);

    OverlayEntry buildCalendarWidgetEntry() {
      return OverlayEntry(
          builder: (context) => Material(
                color: const Color(0xff000000).withAlpha((255 * 0.1).round()),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Dismissible(
                    key: const ValueKey("calendarWidget"),
                    onDismissed: (direction) {
                      calendarOverlay.value?.remove();
                    },
                    direction: DismissDirection.down,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalendarWidget(
                              currDate: currDate,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(20.0),
                              onDateChange: (value) {
                                newDate.value = value;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            EditSheetWidget(
                              editLabel: "변경",
                              onEdit: () {
                                if (newDate.value == null) return;

                                viewModel.onEvent(
                                    SelectNewDate(newDate: newDate.value!));
                                calendarOverlay.value?.remove();
                              },
                              cancelLabel: "취소",
                              onDelete: () {
                                calendarOverlay.value?.remove();
                              },
                              backgroundColor: const Color(0xfff3f3f3),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
    }

    return GestureDetector(
      onTap: () {
        final entry = buildCalendarWidgetEntry();
        calendarOverlay.value = entry;
        Overlay.of(context).insert(entry);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: DateSelectButton(date: "${currDate.year}년 ${currDate.month}월"),
      ),
    );
  }
}
