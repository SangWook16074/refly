import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_view_model.g.dart';

@riverpod
class DateViewModel extends _$DateViewModel {
  @override
  DateTime build() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day);
  }

  void setSelectedDate(DateTime selectedDate) {
    state = selectedDate;
    log(state.toString());
  }
}
