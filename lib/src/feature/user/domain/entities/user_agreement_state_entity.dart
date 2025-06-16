import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_response_dto.dart';

part 'user_agreement_state_entity.freezed.dart';

@freezed
abstract class UserAgreementStateEntity with _$UserAgreementStateEntity {
  const factory UserAgreementStateEntity({
    required bool hasconsentedtopolicy,
  }) = _UserAgreementRequestDto;

  const UserAgreementStateEntity._();

  factory UserAgreementStateEntity.fromResponse(UserAgreementResponseDto dto) {
    return UserAgreementStateEntity(
        hasconsentedtopolicy: dto.hasconsentedtopolicy);
  }
}
