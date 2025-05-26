import 'package:solution_diary_app/src/feature/main/domain/entities/problem_entity.dart';

/// Problem의 비즈니스 로직을 담당하는
/// Problem Model 클래스
class ProblemModel {
  final int? id;
  final String title;
  final String content;
  final bool isDone;
  final DateTime createAt;

  const ProblemModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isDone,
    required this.createAt,
  });

  factory ProblemModel.fromEntity(ProblemEntity entity) {
    return ProblemModel(
        id: entity.id,
        title: entity.title,
        content: entity.content,
        isDone: entity.isDone,
        createAt: entity.createAt);
  }

  ProblemEntity toEntity(String userId) {
    return ProblemEntity(
        id: null,
        title: title,
        content: content,
        isDone: isDone,
        createAt: createAt,
        userId: userId);
  }
}
