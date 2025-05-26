import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_unresolved_problem_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';

part 'unresolved_problem_view_model.g.dart';

@Riverpod(keepAlive: true)
class UnresolvedProblemViewModel extends _$UnresolvedProblemViewModel {
  @override
  Future<List<ProblemModel>> build() async {
    try {
      final result =
          await ref.read(getUserUnresolvedProblemUsecaseProvider).call();
      return result.map((entity) => ProblemModel.fromEntity(entity)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
