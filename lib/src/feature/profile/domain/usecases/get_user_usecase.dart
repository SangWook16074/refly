import 'package:solution_diary_app/src/core/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class GetUserUsecaseImpl implements GetUserUsecase {
  final UserRepository userRepository;

  GetUserUsecaseImpl({required this.userRepository});

  @override
  User call() {
    final user = userRepository.getUser();
    if (user == null) {
      throw Exception("로그인 안됨...");
    }
    return user;
  }
}

abstract class GetUserUsecase {
  User call();
}
