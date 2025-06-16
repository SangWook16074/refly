import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/user_repository_provider.dart';
import 'package:solution_diary_app/src/feature/auth/domain/usecases/update_user_agreement_usecase.dart';

part 'update_user_agreement_usecase_provider.g.dart';

@riverpod
UpdateUserAgreementUsecase updateUserAgreementUsecase(Ref ref) {
  return UpdateUserAgreementUsecaseImpl(
      userRepository: ref.read(userRepositoryProvider));
}
