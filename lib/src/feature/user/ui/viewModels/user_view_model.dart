import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_view_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_view_model.g.dart';

@riverpod
class UserViewModel extends _$UserViewModel {
  @override
  UserViewState build() {
    try {
      final user = ref.read(getUserUsecaseProvider).call();
      return UserViewState.loaded(user: user);
    } on AuthException catch (e) {
      return UserViewState.error(message: e.message);
    }
  }
}
