import 'package:solution_diary_app/src/feature/auth/data/datasources/auth_service.dart';

final class LogoutUsecaseImpl implements LogoutUsecase {
  final AuthService authService;

  LogoutUsecaseImpl({required this.authService});
  @override
  Future<void> call() async {
    await authService.signOut();
  }
}

abstract class LogoutUsecase {
  Future<void> call();
}
