// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProblemImpl _$$ProblemImplFromJson(Map<String, dynamic> json) =>
    _$ProblemImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      title: json['title'] as String,
      content: json['content'] as String,
      isDone: json['isDone'] as bool,
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$ProblemImplToJson(_$ProblemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'isDone': instance.isDone,
      'createAt': instance.createAt.toIso8601String(),
    };
