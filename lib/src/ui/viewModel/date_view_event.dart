import 'package:equatable/equatable.dart';

sealed class DateViewEvent extends Equatable {}

final class SelectNewDate extends DateViewEvent {
  final DateTime newDate;

  SelectNewDate({required this.newDate});
  @override
  List<Object?> get props => [newDate];
}
