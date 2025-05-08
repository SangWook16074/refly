import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/data/problem/repository/problem_repository.dart';
import 'package:solution_diary_app/src/ui/model/problem_view_event.dart';

part 'problem_view_model.g.dart';

@Riverpod(keepAlive: true)
class DailyProblemViewModel extends _$DailyProblemViewModel {
  @override
  Future<List<Problem>> build({required DateTime target}) async {
    try {
      final result =
          ref.read(problemRepositoryProvider).fetchInitalProblems(target);
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  onEvent(ProblemViewEvent event) async {
    switch (event) {
      case CreateProblem():
        final newProblem = event.problem;
        final result =
            await ref.read(problemRepositoryProvider).createProblem(newProblem);
        final prevData = await future;
        state = AsyncData([...prevData, ...result]);
      case ReadProblemList():
        final data = await ref.read(problemRepositoryProvider).getAllProblems();
        state = AsyncData(data);
      case DeleteProblem():
        final id = event.id;
        final prevData = await future;
        await ref.read(problemRepositoryProvider).deleteProblem(id);

        state = AsyncData(prevData.where((it) => it.id != id).toList());

      case UpdateProblem():
      // TODO: Handle this case.
    }
  }
}
