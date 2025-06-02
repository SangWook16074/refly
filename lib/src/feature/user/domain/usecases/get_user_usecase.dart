import 'dart:developer';

import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class GetUserUsecaseImpl implements GetUserUsecase {
  final UserRepository userRepository;

  GetUserUsecaseImpl({required this.userRepository});

  @override
  User call() {
    final user = userRepository.getUser();
    if (user == null) {
      throw const AuthException("로그인되지 않은 사용자입니다!");
    }
    return user;
  }
}

abstract class GetUserUsecase {
  User call();
}
