import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';

final class GetUserAgreementStateUsecaseImpl
    implements GetUserAgreementStateUsecase {
  final UserRepository userRepository;
  const GetUserAgreementStateUsecaseImpl({
    required this.userRepository,
  });

  @override
  Future<bool> call() async {
    try {
      final user = userRepository.getUser();
      if (user == null) throw Exception("로그인 안됨...");
      final uid = user.id;
      final response = await userRepository.getUserAgreementState(uid);
      return response.hasconsentedtopolicy;
    } catch (e) {
      rethrow;
    }
  }
}

abstract class GetUserAgreementStateUsecase {
  Future<bool> call();
}
