import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_agreement_request_dto.freezed.dart';
part 'user_agreement_request_dto.g.dart';

@freezed
abstract class UserAgreementRequestDto with _$UserAgreementRequestDto {
  factory UserAgreementRequestDto({
    @Default(true) bool hasconsentedtopolicy,
    required DateTime agreedat,
  }) = _UserAgreementRequestDto;

  factory UserAgreementRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UserAgreementRequestDtoFromJson(json);
}
