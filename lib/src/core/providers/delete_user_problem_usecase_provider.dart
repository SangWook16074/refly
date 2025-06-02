import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/problem_repository_provider.dart';
import 'package:solution_diary_app/src/core/usecases/delete_user_problem_usecase.dart';

part 'delete_user_problem_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
DeleteUserProblemUsecase deleteUserProblemUsecase(Ref ref) {
  return DeleteUserProblemUsecaseImpl(
    problemRepository: ref.read(problemRepositoryProvider),
  );
}
