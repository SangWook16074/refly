import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_request_dto.freezed.dart';
part 'problem_request_dto.g.dart';

@freezed
abstract class ProblemRequestDto with _$ProblemRequestDto {
  const factory ProblemRequestDto({
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "is_done") required bool isDone,
    @JsonKey(name: "created_at") required DateTime createAt,
  }) = _ProblemRequestDto;

  factory ProblemRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ProblemRequestDtoFromJson(json);
}
