import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/problem_repository_provider.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/problem/domain/usecases/update_user_problem_usecase.dart';

part 'update_user_problem_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
UpdateUserProblemUsecase updateUserProblemUsecase(Ref ref) {
  return UpdateUserProblemUsecaseImpl(
      problemRepository: ref.read(problemRepositoryProvider),
      userRepository: ref.read(userRepositoryProvider));
}
