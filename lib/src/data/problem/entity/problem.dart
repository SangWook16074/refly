import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem.freezed.dart';
part 'problem.g.dart';

@freezed
abstract class Problem with _$Problem {
  const factory Problem({
    @Default(null) int? id,
    required String title,
    required String content,
    required bool isDone,
    required DateTime createAt,
  }) = _Problem;

  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
}
