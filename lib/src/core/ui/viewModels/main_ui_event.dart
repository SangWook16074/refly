import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_event.freezed.dart';

@freezed
sealed class MainUiEvent with _$MainUiEvent {
  const factory MainUiEvent.userScrolled({required double extent}) =
      _$UserScrolled;

  const factory MainUiEvent.userLogoutButtonTaped() = _$UserLogoutButtonTaped;

  const factory MainUiEvent.userDeleteUserButtonTaped() =
      _$UserDeleteUserButtonTaped;
}
