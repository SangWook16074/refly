import 'package:solution_diary_app/src/feature/main/domain/repositories/user_repository.dart';
import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';

import '../entities/problem_entity.dart';
import '../repositories/problem_repository.dart';

final class CreateUserProblemUsecaseImpl implements CreateUserProblemUsecase {
  final ProblemRepository problemRepository;
  final UserRepository userRepository;
  CreateUserProblemUsecaseImpl(
      {required this.problemRepository, required this.userRepository});

  @override
  Future<List<ProblemEntity>> call(ProblemModel problem) {
    final user = userRepository.getUser();
    if (user == null) {
      throw Exception("로그인 안됨...");
    }

    return problemRepository.createNewProblem(problem.toEntity(user.id));
  }
}

abstract class CreateUserProblemUsecase {
  Future<List<ProblemEntity>> call(ProblemModel problem);
}
