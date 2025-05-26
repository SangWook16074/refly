import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/feature/auth/data/datasources/auth_service.dart';

part 'auth_service_provider.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(Ref ref) {
  return AuthService();
}
