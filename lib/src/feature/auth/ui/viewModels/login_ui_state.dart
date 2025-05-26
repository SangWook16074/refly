import 'package:equatable/equatable.dart';

sealed class LoginUiState extends Equatable {}

final class NotLoggedIn extends LoginUiState {
  @override
  List<Object?> get props => [];
}

final class Progress extends LoginUiState {
  @override
  List<Object?> get props => [];
}

final class LoggedIn extends LoginUiState {
  @override
  List<Object?> get props => [];
}

final class Error extends LoginUiState {
  final String message;
  Error({required this.message});
  @override
  List<Object?> get props => [message];
}
