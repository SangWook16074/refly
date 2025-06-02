import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';

part 'problem_list_view_state.freezed.dart';

@freezed
abstract class ProblemListViewState with _$ProblemListViewState {
  const factory ProblemListViewState({
    @Default(-1) int selectIndex,
    @Default(null) ProblemModel? problem,
    @Default(false) bool showSheet,
  }) = _ProblemListViewState;
}
