import 'dart:developer';

import 'package:solution_diary_app/src/feature/user/data/dtos/user_stat_response_dto.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

extension on UserStatResponseDto {
  UserStat toEntity() {
    return UserStat(total: total, solve: solve, unsolve: unsolve);
  }
}

final class GetUserStatUsecaseImpl implements GetUserStatUsecase {
  final ProblemRepository problemRepository;

  final UserRepository userRepository;

  GetUserStatUsecaseImpl(
      {required this.problemRepository, required this.userRepository});

  @override
  Future<UserStat> call() async {
    try {
      final user = userRepository.getUser();
      if (user == null) {
        throw Exception("로그인 안됨...");
      }
      final userId = user.id;
      final response = await problemRepository.fetchUserStat(userId);
      return response.toEntity();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

abstract class GetUserStatUsecase {
  Future<UserStat> call();
}
