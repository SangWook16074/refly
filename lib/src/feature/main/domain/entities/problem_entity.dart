import 'package:equatable/equatable.dart';
import 'package:solution_diary_app/src/feature/main/data/dtos/problem_request_dto.dart';

final class ProblemEntity extends Equatable {
  final int? id;
  final String title;
  final String content;
  final bool isDone;
  final DateTime createAt;
  final String userId;

  const ProblemEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.isDone,
    required this.createAt,
    required this.userId,
  });

  ProblemRequestDto toRequest() {
    return ProblemRequestDto(
        title: title,
        content: content,
        isDone: isDone,
        createAt: createAt,
        userId: userId);
  }

  @override
  List<Object?> get props => [id, title, content, isDone, createAt, userId];
}
