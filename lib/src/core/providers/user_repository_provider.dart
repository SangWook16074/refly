import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/user_api_service_provider.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(service: ref.read(userApiServiceProvider));
}
