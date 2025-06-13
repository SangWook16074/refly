import 'package:equatable/equatable.dart';
import 'package:solution_diary_app/src/feature/problem/domain/entities/problem_entity.dart';

/// Problem의 비즈니스 로직을 담당하는
/// Problem Model 클래스
class ProblemModel extends Equatable {
  final int? id;
  final String title;
  final String content;
  final bool isDone;
  final DateTime createAt;
  final bool isFavorite;
  final String solution;

  const ProblemModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isDone,
    required this.createAt,
    required this.isFavorite,
    this.solution = "",
  });

  factory ProblemModel.fromEntity(ProblemEntity entity) {
    return ProblemModel(
        id: entity.id,
        title: entity.title,
        content: entity.content,
        isDone: entity.isDone,
        createAt: entity.createAt,
        isFavorite: entity.isFavorite,
        solution: entity.solution);
  }

  ProblemEntity toEntity(String userId) {
    return ProblemEntity(
        id: id,
        title: title,
        content: content,
        isDone: isDone,
        createAt: createAt,
        userId: userId,
        isFavorite: isFavorite,
        solution: solution);
  }

  ProblemModel copyWith({
    String? title,
    String? content,
    bool? isDone,
    DateTime? createAt,
    String? userId,
    bool? isFavorite,
    String? solution,
  }) {
    return ProblemModel(
        id: id,
        title: title ?? this.title,
        content: content ?? this.content,
        isDone: isDone ?? this.isDone,
        createAt: createAt ?? this.createAt,
        isFavorite: isFavorite ?? this.isFavorite,
        solution: solution ?? this.solution);
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        isDone,
        createAt,
        isFavorite,
        solution,
      ];
}
