import 'package:solution_diary_app/src/feature/problem/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

final class GetUserAllProblemUsecaseImpl implements GetUserAllProblemUsecase {
  final ProblemRepository problemRepository;
  final UserRepository userRepository;

  GetUserAllProblemUsecaseImpl({
    required this.problemRepository,
    required this.userRepository,
  });

  @override
  Future<List<ProblemEntity>> call() {
    final user = userRepository.getUser();
    if (user == null) {
      throw Exception("로그인 안됨...");
    }
    return problemRepository.getAllProblems(user.id);
  }
}

abstract class GetUserAllProblemUsecase {
  Future<List<ProblemEntity>> call();
}
