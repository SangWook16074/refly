import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_list_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_list_view_state.dart';

part 'problem_list_view_model.g.dart';

@riverpod
class ProblemListViewModel extends _$ProblemListViewModel {
  @override
  ProblemListViewState build() {
    return const ProblemListViewState();
  }

  onEvent(ProblemListViewEvent event) {
    switch (event) {
      case SelectProblem():
        log("기록 선택");
        state = state.copyWith(
            selectIndex: event.index, problem: event.problem, showSheet: true);
      default:
        log("기록 선택 해제");
        state = state.copyWith(selectIndex: -1, showSheet: false);
    }
  }
}
