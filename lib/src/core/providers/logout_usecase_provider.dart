import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/auth_service_provider.dart';
import 'package:solution_diary_app/src/core/usecases/logout_usecase.dart';

part 'logout_usecase_provider.g.dart';

@Riverpod(keepAlive: true)
LogoutUsecase logoutUsecase(Ref ref) {
  return LogoutUsecaseImpl(authService: ref.read(authServiceProvider));
}
