import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_usecase_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_view_model.g.dart';

@riverpod
class UserViewModel extends _$UserViewModel {
  @override
  User build() {
    return ref.read(getUserUsecaseProvider).call();
  }
}
