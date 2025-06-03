import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_state.freezed.dart';

@freezed
abstract class MainUiState with _$MainUiState {
  const factory MainUiState({
    @Default(0.375) double snapProgress,
    @Default(0.0) double userStateOpacity,
    @Default(1.0) double dateWidgetOpacity,
  }) = _MainUIState;
}
