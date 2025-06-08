import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/create_user_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/delete_user_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/get_user_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/update_user_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_view_event.dart';

part 'daily_problem_view_model.g.dart';

@Riverpod(keepAlive: true)
class DailyProblemViewModel extends _$DailyProblemViewModel {
  @override
  Future<List<ProblemModel>> build({required DateTime target}) async {
    try {
      final result =
          await ref.read(getUserProblemsUsecaseProvider).call(target);
      log(result.toString());
      return result.map((entity) => ProblemModel.fromEntity(entity)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> onEvent(ProblemViewEvent event) async {
    switch (event) {
      case CreateProblem():
        final newProblem = event.problem;
        final result =
            await ref.read(createUserProblemUsecaseProvider).call(newProblem);
        final prevData = await future;
        state = AsyncData([
          ...prevData,
          ...result.map((entity) => ProblemModel.fromEntity(entity))
        ]);
      case DeleteProblem():
        final id = event.id;
        final prevData = state.value!;
        await ref.read(deleteUserProblemUsecaseProvider).call(id);

        state = AsyncData(prevData.where((it) => it.id != id).toList());

      case UpdateProblem():
        final problem = event.problem;
        final prevData = state.value!;
        state = AsyncData(prevData.map((it) {
          if (it.id == problem.id) {
            return problem;
          } else {
            return it;
          }
        }).toList());
        await ref.read(updateUserProblemUsecaseProvider).call(problem);
    }
  }
}
