import 'package:solution_diary_app/src/feature/problem/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      throw const AuthException("로그인 안됨...");
    }
    return problemRepository.getAllUnresolvedProblems(user.id);
  }
}

abstract class GetUserUnresolvedProblemUsecase {
  Future<List<ProblemEntity>> call();
}
