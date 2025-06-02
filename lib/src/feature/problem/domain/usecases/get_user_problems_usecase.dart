import 'package:solution_diary_app/src/feature/problem/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

final class GetUserProblemsByDateUsecaseImpl
    implements GetUserProblemsByDateUsecase {
  final ProblemRepository problemRepository;
  final UserRepository userRepository;
  GetUserProblemsByDateUsecaseImpl(
      {required this.problemRepository, required this.userRepository});

  @override
  Future<List<ProblemEntity>> call(DateTime date) {
    final user = userRepository.getUser();
    if (user == null) {
      throw Exception("로그인 안됨...");
    }
    return problemRepository.fetchProblemsByDate(date, user.id);
  }
}

abstract class GetUserProblemsByDateUsecase {
  Future<List<ProblemEntity>> call(DateTime date);
}
