import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/data/problem/repository/problem_repository.dart';

part 'user_problem_list_view_model.g.dart';

@riverpod
class UserProblemListViewModel extends _$UserProblemListViewModel {
  @override
  Future<List<Problem>> build() {
    return ref.read(problemRepositoryProvider).getAllProblems();
  }
}
