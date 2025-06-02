import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';

part 'user_all_problem_list_state.freezed.dart';

@freezed
abstract class UserAllProblemListState with _$UserAllProblemListState {
  const factory UserAllProblemListState({
    required List<ProblemModel> problems,
  }) = _UserAllProblemListState;
}
