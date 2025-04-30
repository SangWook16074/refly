import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/data/problem/repository/problem_repository.dart';

part 'unresolved_problem_view_model.g.dart';

@Riverpod(keepAlive: true)
class UnresolvedProblemViewModel extends _$UnresolvedProblemViewModel {
  @override
  Future<List<Problem>> build() async {
    try {
      final result = ref.read(problemRepositoryProvider).getAllProblems();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
