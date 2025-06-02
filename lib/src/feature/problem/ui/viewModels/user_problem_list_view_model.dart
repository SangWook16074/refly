import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_all_problem_usecase_provider.dart';
import '../../data/models/problem_model.dart';

part 'user_problem_list_view_model.g.dart';

@riverpod
class UserProblemListViewModel extends _$UserProblemListViewModel {
  @override
  Future<List<ProblemModel>> build() async {
    final result = await ref.read(getUserAllProblemUsecaseProvider).call();
    return result.map((entity) => ProblemModel.fromEntity(entity)).toList();
  }
}
