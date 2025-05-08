import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/auth_service_provider.dart';
import 'package:solution_diary_app/src/ui/model/login_ui_event.dart';
import 'package:solution_diary_app/src/ui/model/login_ui_state.dart';

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
    }
  }

  Future<void> googleLogin() async {
    await ref.read(authServiceProvider).nativeGoogleSignIn();
  }
}
