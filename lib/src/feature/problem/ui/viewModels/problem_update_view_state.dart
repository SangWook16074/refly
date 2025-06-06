import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';

part 'problem_update_view_state.freezed.dart';

@freezed
abstract class ProblemUpdateViewState with _$ProblemUpdateViewState {
  const factory ProblemUpdateViewState({
    required ProblemModel problem,
  }) = _ProblemUpdateViewState;

  const ProblemUpdateViewState._();

  bool get validateTitle {
    // 공백제거시 빈칸인 경우는 잘못된 경우
    if (problem.title.trim().isEmpty) {
      return false;
    }

    // 그 외에는 모두 올바른 경우
    return true;
  }
}
