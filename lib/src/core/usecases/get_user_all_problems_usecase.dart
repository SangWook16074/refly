import 'package:solution_diary_app/src/feature/problem/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class GetUserAllProblemsUsecaseImpl implements GetUserAllProblemsUsecase {
  final ProblemRepository problemRepository;
  final UserRepository userRepository;

  GetUserAllProblemsUsecaseImpl(
      {required this.problemRepository, required this.userRepository});

  @override
  Future<List<ProblemEntity>> call() {
    final user = userRepository.getUser();
    if (user == null) {
      throw const AuthException("로그인이 안된 사용자입니다!");
    }
    final userId = user.id;
    return problemRepository.getAllProblems(userId);
  }
}

abstract class GetUserAllProblemsUsecase {
  Future<List<ProblemEntity>> call();
}
