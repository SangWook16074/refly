import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/problem_api_service_provider.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';

part 'problem_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProblemRepository problemRepository(Ref ref) {
  return ProblemRepositoryImpl(service: ref.read(problemApiServiceProvider));
}
