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
      return ref.read(getAllProblemsProvider.future);
    } catch (e) {
      rethrow;
    }
  }

  onEvent(ProblemViewEvent event) {
    switch (event) {
      case CreateProblem():
      case ReadProblemList():
      // TODO: Handle this case.
      case UpdateProblem():
      // TODO: Handle this case.
      case DeleteProblem():
      // TODO: Handle this case.
    }
  }
}
