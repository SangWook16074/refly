import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/problem_repository_provider.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/main/domain/usecases/get_user_unresolved_problem_usecase.dart';

part 'get_user_unresolved_problem_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
GetUserUnresolvedProblemUsecase getUserUnresolvedProblemUsecase(Ref ref) {
  return GetUserUnresolvedProblemUsecaseImpl(
      problemRepository: ref.read(problemRepositoryProvider),
      userRepository: ref.read(userRepositoryProvider));
}
