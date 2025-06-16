import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/auth/domain/usecases/get_user_agreement_state_usecase.dart';

part 'get_user_agreement_state_usecase_provider.g.dart';

@riverpod
GetUserAgreementStateUsecase getUserAgreementStateUsecase(Ref ref) {
  return GetUserAgreementStateUsecaseImpl(
      userRepository: ref.read(userRepositoryProvider));
}
