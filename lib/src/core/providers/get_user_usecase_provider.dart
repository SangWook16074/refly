import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/user/domain/usecases/get_user_usecase.dart';

part 'get_user_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
GetUserUsecase getUserUsecase(Ref ref) {
  return GetUserUsecaseImpl(userRepository: ref.read(userRepositoryProvider));
}
