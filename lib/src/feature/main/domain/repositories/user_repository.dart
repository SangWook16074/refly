import 'package:solution_diary_app/src/feature/main/data/datasources/user_api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserApiService service;

  UserRepositoryImpl({required this.service});

  @override
  User? getUser() {
    return service.getUser();
  }
}

abstract class UserRepository {
  User? getUser();
}
