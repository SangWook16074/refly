import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_update_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_update_view_state.dart';

part 'problem_update_view_model.g.dart';

@riverpod
class ProblemUpdateViewModel extends _$ProblemUpdateViewModel {
  @override
  ProblemUpdateViewState build(ProblemModel problem) {
    return ProblemUpdateViewState(problem: problem);
  }

  onEvent(ProblemUpdateViewEvent event) {
    event.when(titleChanged: (String title) {
      final prev = state.problem;
      final curr = prev.copyWith(title: title);
      state = state.copyWith(problem: curr);
    }, contentChanged: (String content) {
      final prev = state.problem;
      final curr = prev.copyWith(content: content);
      state = state.copyWith(problem: curr);
    });
    log(state.toString());
  }
}
