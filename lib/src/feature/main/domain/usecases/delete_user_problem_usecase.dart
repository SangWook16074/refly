import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/main/domain/repositories/problem_repository.dart';

final class DeleteUserProblemUsecaseImpl implements DeleteUserProblemUsecase {
  final ProblemRepository problemRepository;

  DeleteUserProblemUsecaseImpl({required this.problemRepository});

  @override
  void call(int id) async {
    await problemRepository.deleteProblem(id);
  }
}

abstract class DeleteUserProblemUsecase {
  void call(int id);
}
