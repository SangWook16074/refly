import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/auth_service_provider.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_event.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_state.dart';

part 'login_ui_view_model.g.dart';

@riverpod
class LoginUiViewModel extends _$LoginUiViewModel {
  @override
  LoginUiState build() {
    return NotLoggedIn();
  }

  onEvent(LoginUiEvent event) async {
    switch (event) {
      case GoogleLoginButtonTap():
        await googleLogin();
      case AppleLoginButtonTap():
        await appleLogin();
    }
  }

  Future<void> googleLogin() async {
    try {
      state = Progress();
      await ref.read(authServiceProvider).nativeGoogleSignIn();
    } catch (e) {
      log(e.toString());
      state = NotLoggedIn();
    }
  }

  Future<void> appleLogin() async {
    try {
      state = Progress();
      await ref.read(authServiceProvider).signInWithApple();
    } catch (e) {
      log(e.toString());
      state = NotLoggedIn();
    }
  }
}
