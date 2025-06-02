import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/problem_repository_provider.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/problem/domain/usecases/get_user_all_problem_usecase.dart';

part 'get_user_all_problem_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
GetUserAllProblemUsecase getUserAllProblemUsecase(Ref ref) {
  return GetUserAllProblemUsecaseImpl(
      problemRepository: ref.read(problemRepositoryProvider),
      userRepository: ref.read(userRepositoryProvider));
}
