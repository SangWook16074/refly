import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

final class UpdateUserAgreementUsecaseImpl
    implements UpdateUserAgreementUsecase {
  final UserRepository userRepository;
  const UpdateUserAgreementUsecaseImpl({required this.userRepository});

  @override
  Future<void> call() async {
    final user = userRepository.getUser();
    if (user == null) throw Exception("로그인 안됨...");
    try {
      final uid = user.id;
      await userRepository.updateUserAgreementState(uid);
    } catch (e) {
      rethrow;
    }
  }
}

abstract class UpdateUserAgreementUsecase {
  Future<void> call();
}
