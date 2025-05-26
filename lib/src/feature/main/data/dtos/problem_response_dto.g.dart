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
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$ProblemResponseDtoImplToJson(
        _$ProblemResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'is_done': instance.isDone,
      'created_at': instance.createAt.toIso8601String(),
      'uid': instance.uid,
    };
