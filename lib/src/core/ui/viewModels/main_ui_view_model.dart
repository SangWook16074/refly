import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/delete_user_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/delete_user_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/logout_usecase_provider.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_event.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_state.dart';

part 'main_ui_view_model.g.dart';

@riverpod
class MainUiViewModel extends _$MainUiViewModel {
  @override
  MainUiState build() {
    return const MainUiState();
  }

  /// MainUI 사용자 이벤트 핸들러
  onEvent(MainUiEvent event) {
    event.when(userScrolled: (double extent) {
      log("user scrolled detect");
      state = state.copyWith(
          dateWidgetOpacity: _calculateDateWidgetOpacity(extent),
          userStateOpacity: _calculateUserStateOpacity(extent),
          snapProgress: _calculateYPosition(extent));
    }, userLogoutButtonTaped: () async {
      log("user logout button taped");
      await ref.read(logoutUsecaseProvider).call();
    }, userDeleteUserButtonTaped: () async {
      log("user delete user button taped");
      await ref.read(deleteUserUsecaseProvider).call();
    });
  }

  double _calculateDateWidgetOpacity(double extent) {
    final opacity = (1 - extent) * 20 / 3;
    if (opacity > 1.0) {
      return 1.0;
    } else {
      return opacity;
    }
  }

  double _calculateUserStateOpacity(double extent) {
    const start = 0.85;
    const end = 0.6;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    return result;
  }

  double _calculateYPosition(double extent) {
    final snapProgress = (1 - extent) * 100 / 40;
    return snapProgress;
  }
}
