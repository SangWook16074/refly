import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_agreement_response_dto.freezed.dart';
part 'user_agreement_response_dto.g.dart';

@freezed
abstract class UserAgreementResponseDto with _$UserAgreementResponseDto {
  const factory UserAgreementResponseDto({
    required bool hasconsentedtopolicy,
  }) = _UserAgreementRequestDto;

  factory UserAgreementResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserAgreementResponseDtoFromJson(json);
}
