import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/problem_repository_provider.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/main/domain/usecases/create_user_problem_usecase.dart';

part 'create_user_problem_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
CreateUserProblemUsecase createUserProblemUsecase(Ref ref) {
  return CreateUserProblemUsecaseImpl(
      problemRepository: ref.read(problemRepositoryProvider),
      userRepository: ref.read(userRepositoryProvider));
}
