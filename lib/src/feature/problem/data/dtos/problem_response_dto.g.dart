// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProblemResponseDtoImpl _$$ProblemResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProblemResponseDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      content: json['content'] as String? ?? "",
      isDone: json['is_done'] as bool,
      createAt: DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String,
      isFavorite: json['is_favorite'] as bool,
      solution: json['solution'] as String? ?? "",
    );

Map<String, dynamic> _$$ProblemResponseDtoImplToJson(
        _$ProblemResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'is_done': instance.isDone,
      'created_at': instance.createAt.toIso8601String(),
      'user_id': instance.userId,
      'is_favorite': instance.isFavorite,
      'solution': instance.solution,
    };
