// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_agreement_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAgreementRequestDtoImpl _$$UserAgreementRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAgreementRequestDtoImpl(
      hasconsentedtopolicy: json['hasconsentedtopolicy'] as bool? ?? true,
      agreedat: DateTime.parse(json['agreedat'] as String),
    );

Map<String, dynamic> _$$UserAgreementRequestDtoImplToJson(
        _$UserAgreementRequestDtoImpl instance) =>
    <String, dynamic>{
      'hasconsentedtopolicy': instance.hasconsentedtopolicy,
      'agreedat': instance.agreedat.toIso8601String(),
    };
