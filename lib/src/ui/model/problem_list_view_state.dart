import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';

part 'problem_list_view_state.freezed.dart';

@freezed
abstract class ProblemListViewState with _$ProblemListViewState {
  const factory ProblemListViewState({
    @Default(-1) int selectIndex,
    @Default(null) Problem? problem,
    @Default(false) bool showSheet,
  }) = _ProblemListViewState;
}
