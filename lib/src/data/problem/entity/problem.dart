import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem.freezed.dart';
part 'problem.g.dart';

/// 사용자가 기록한 문제의 Entity
///
/// 서버로부터의 응답을 [Problem]클래스로 직렬화합니다.
/// [id]는 서버에 저정된 기록의 고유 id입니다.
/// [title]은 서버에서 불러온 기록의 제목입니다.
/// [content]는 서버에서 불러온 기록의 내용입니다. 선택적으로 지정하지 않았다면 null을 반환합니다.
/// [createAt]은 서버에 사용자가 기록을 한 시간입니다.
@freezed
abstract class Problem with _$Problem {
  const factory Problem({
    @JsonKey(name: "id") @Default(null) int? id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "content") required String? content,
    @JsonKey(name: "is_done") required bool isDone,
    @JsonKey(name: "created_at") required DateTime createAt,
  }) = _Problem;

  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
}
