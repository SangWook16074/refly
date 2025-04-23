import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:solution_diary_app/src/data/problem/repository/problem_repository.dart';
import 'package:solution_diary_app/src/ui/problem/model/problem_view_event.dart';

part 'problem_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProblemViewModel extends _$ProblemViewModel {
  @override
  Future<List<Problem>> build() async {
    try {
      final result = ref.read(problemRepositoryProvider).getAllProblems();
      return result;
    } catch (e) {
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
