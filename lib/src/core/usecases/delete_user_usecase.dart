import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

final class DeleteUserUsecaseImpl implements DeleteUserUsecase {
  final UserRepository userRepository;

  const DeleteUserUsecaseImpl({required this.userRepository});
  @override
  Future<void> call() async {
    final user = userRepository.getUser();
    if (user == null) throw Exception("로그인 안됨...");
    final uid = user.id;
    await userRepository.deleteUser(uid);
  }
}

abstract class DeleteUserUsecase {
  Future<void> call();
}
