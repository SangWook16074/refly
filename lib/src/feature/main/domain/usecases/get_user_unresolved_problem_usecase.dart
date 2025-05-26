import 'package:solution_diary_app/src/feature/main/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/main/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/feature/main/domain/repositories/user_repository.dart';

final class GetUserUnresolvedProblemUsecaseImpl
    implements GetUserUnresolvedProblemUsecase {
  final ProblemRepository problemRepository;
  final UserRepository userRepository;

  GetUserUnresolvedProblemUsecaseImpl({
    required this.problemRepository,
    required this.userRepository,
  });

  @override
  Future<List<ProblemEntity>> call() {
    final user = userRepository.getUser();
    if (user == null) {
      throw Exception("로그인 안됨...");
    }
    return problemRepository.getAllUnresolvedProblems(user.id);
  }
}

abstract class GetUserUnresolvedProblemUsecase {
  Future<List<ProblemEntity>> call();
}
