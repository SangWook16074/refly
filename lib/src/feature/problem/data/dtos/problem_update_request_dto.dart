import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_update_request_dto.freezed.dart';
part 'problem_update_request_dto.g.dart';

@freezed
abstract class ProblemUpdateRequestDto with _$ProblemUpdateRequestDto {
  const factory ProblemUpdateRequestDto({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "is_done") required bool isDone,
    @JsonKey(name: "created_at") required DateTime createAt,
    @JsonKey(name: "user_id") required String userId,
  }) = _ProblemUpdateRequestDto;

  factory ProblemUpdateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ProblemUpdateRequestDtoFromJson(json);
}
