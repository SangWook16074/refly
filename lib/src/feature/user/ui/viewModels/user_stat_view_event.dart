import 'package:equatable/equatable.dart';

sealed class UserStatViewEvent extends Equatable {}

final class RefreshUserStat extends UserStatViewEvent {
  @override
  List<Object?> get props => [];
}
