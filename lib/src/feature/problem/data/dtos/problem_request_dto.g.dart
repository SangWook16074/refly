// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProblemRequestDtoImpl _$$ProblemRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProblemRequestDtoImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      isDone: json['is_done'] as bool,
      createAt: DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String,
      isFavorite: json['is_favorite'] as bool,
    );

Map<String, dynamic> _$$ProblemRequestDtoImplToJson(
        _$ProblemRequestDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'is_done': instance.isDone,
      'created_at': instance.createAt.toIso8601String(),
      'user_id': instance.userId,
      'is_favorite': instance.isFavorite,
    };
