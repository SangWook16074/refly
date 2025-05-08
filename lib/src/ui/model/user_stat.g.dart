// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatImpl _$$UserStatImplFromJson(Map<String, dynamic> json) =>
    _$UserStatImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
      solve: (json['solve'] as num?)?.toInt() ?? 0,
      unsolve: (json['unsolve'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserStatImplToJson(_$UserStatImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'solve': instance.solve,
      'unsolve': instance.unsolve,
    };
