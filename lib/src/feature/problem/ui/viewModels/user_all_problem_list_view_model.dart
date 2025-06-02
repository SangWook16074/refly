import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_all_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/user_all_problem_list_state.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';

part 'user_all_problem_list_view_model.g.dart';

@riverpod
class UserAllProblemListViewModel extends _$UserAllProblemListViewModel {
  @override
  Future<UserAllProblemListState> build() async {
    final result = await ref.read(getUserAllProblemUsecaseProvider).call();
    return UserAllProblemListState(
        problems:
            result.map((entity) => ProblemModel.fromEntity(entity)).toList());
  }
}
