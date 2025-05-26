import 'package:equatable/equatable.dart';

sealed class LoginUiEvent extends Equatable {}

final class GoogleLoginButtonTap extends LoginUiEvent {
  @override
  List<Object?> get props => [];
}

final class AppleLoginButtonTap extends LoginUiEvent {
  @override
  List<Object?> get props => [];
}
