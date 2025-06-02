import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/date_view_event.dart';

part 'date_view_model.g.dart';

@riverpod
class DateViewModel extends _$DateViewModel {
  @override
  DateTime build() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day);
  }

  void onEvent(DateViewEvent event) {
    switch (event) {
      case SelectNewDate():
        final newDate = event.newDate;
        state = newDate;
        log(state.toString());
    }
  }
}
