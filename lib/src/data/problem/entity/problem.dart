import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem.freezed.dart';
part 'problem.g.dart';

@freezed
abstract class Problem with _$Problem {
  const factory Problem({
    @JsonKey(name: "id") @Default(null) int? id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "is_done") required bool isDone,
    @JsonKey(name: "created_at") required DateTime createAt,
  }) = _Problem;

  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
}
