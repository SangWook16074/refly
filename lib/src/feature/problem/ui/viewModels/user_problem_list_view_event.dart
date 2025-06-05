import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';

part 'user_problem_list_view_event.freezed.dart';

@freezed
sealed class UserProblemListViewEvent with _$UserProblemListViewEvent {
  const factory UserProblemListViewEvent.delete({
    required int id,
  }) = _DeleteButtonTap;
  const factory UserProblemListViewEvent.update({
    required ProblemModel problem,
  }) = _UpdateButtonTap;
}
