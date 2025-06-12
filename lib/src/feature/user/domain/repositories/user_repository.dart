import 'package:solution_diary_app/src/feature/user/data/datasources/edge_function_service.dart';
import 'package:solution_diary_app/src/feature/user/data/datasources/user_api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserApiService service;
  final EdgeFunctionService edgeFunctionService;
  const UserRepositoryImpl(
      {required this.service, required this.edgeFunctionService});

  @override
  User? getUser() {
    return service.getUser();
  }

  @override
  Future<void> deleteUser(String uid) async {
    await edgeFunctionService.deleteUserViaEdgeFunction(uid);
  }
}

abstract class UserRepository {
  User? getUser();

  Future<void> deleteUser(String uid);
}
