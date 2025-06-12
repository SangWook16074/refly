import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/core/usecases/delete_user_usecase.dart';

part 'delete_user_usecase_provider.g.dart';

@riverpod
DeleteUserUsecase deleteUserUsecase(Ref ref) {
  return DeleteUserUsecaseImpl(
      userRepository: ref.read(userRepositoryProvider));
}
