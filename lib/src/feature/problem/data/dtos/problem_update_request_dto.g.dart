// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_update_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProblemUpdateRequestDtoImpl _$$ProblemUpdateRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProblemUpdateRequestDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      isDone: json['is_done'] as bool,
      createAt: DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$$ProblemUpdateRequestDtoImplToJson(
        _$ProblemUpdateRequestDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'is_done': instance.isDone,
      'created_at': instance.createAt.toIso8601String(),
      'user_id': instance.userId,
    };
