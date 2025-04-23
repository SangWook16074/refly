import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_request_dto.freezed.dart';
part 'problem_request_dto.g.dart';

/// 사용자가 서버에 새로운 기록을 저장하기 위한 DTO 클래스
///
/// 모든 프로퍼티는 [Problem]과 동일하나, [id]필드는 존재하지 않습니다.
/// 오직 서버에 새로운 데이터를 저장하기 위해 사용합니다.
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
