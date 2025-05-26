// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stat_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatResponseDtoImpl _$$UserStatResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatResponseDtoImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
      solve: (json['solve'] as num?)?.toInt() ?? 0,
      unsolve: (json['unsolve'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserStatResponseDtoImplToJson(
        _$UserStatResponseDtoImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'solve': instance.solve,
      'unsolve': instance.unsolve,
    };
