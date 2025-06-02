import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_view_state.freezed.dart';

@freezed
sealed class UserViewState with _$UserViewState {
  const factory UserViewState.loaded({
    required User user,
  }) = _LoadedState;
  const factory UserViewState.error({
    required String message,
  }) = _ErrorState;
}
