import 'package:supabase_flutter/supabase_flutter.dart';

class UserApiServiceImpl implements UserApiService {
  final SupabaseClient client;
  UserApiServiceImpl({required this.client});

  /// 현재 유저 정보
  @override
  User? getUser() {
    return client.auth.currentUser;
  }
}

abstract class UserApiService {
  User? getUser();
}
