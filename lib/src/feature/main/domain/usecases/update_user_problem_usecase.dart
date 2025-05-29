import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/main/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/main/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/core/domain/repositories/user_repository.dart';

final class UpdateUserProblemUsecaseImpl implements UpdateUserProblemUsecase {
  final ProblemRepository problemRepository;
  final UserRepository userRepository;
  UpdateUserProblemUsecaseImpl({
    required this.problemRepository,
    required this.userRepository,
  });
  @override
  Future<List<ProblemEntity>> call(ProblemModel problem) {
    final user = userRepository.getUser();
    if (user == null) {
      throw Exception("로그인 안됨...");
    }
    final userId = user.id;
    return problemRepository.updateProblem(problem.toEntity(userId));
  }
}

abstract class UpdateUserProblemUsecase {
  Future<List<ProblemEntity>> call(ProblemModel problem);
}
