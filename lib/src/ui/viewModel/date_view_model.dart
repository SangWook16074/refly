import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_view_model.g.dart';

@riverpod
class DateViewModel extends _$DateViewModel {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setSelectedDate(DateTime selectedDate) {
    state = selectedDate;
  }
}
