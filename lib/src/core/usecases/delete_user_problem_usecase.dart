import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';

final class DeleteUserProblemUsecaseImpl implements DeleteUserProblemUsecase {
  final ProblemRepository problemRepository;

  DeleteUserProblemUsecaseImpl({required this.problemRepository});

  @override
  Future<void> call(int id) async {
    await problemRepository.deleteProblem(id);
  }
}

abstract class DeleteUserProblemUsecase {
  Future<void> call(int id);
}
