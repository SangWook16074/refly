import 'package:flutter_test/flutter_test.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_response_dto.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_update_request_dto.dart';

void main() {
  group('ProblemRequestDto', () {
    test('toJson/fromJson이 올바르게 동작한다', () {
      final dto = ProblemRequestDto(
        title: 'title',
        content: 'content',
        isDone: false,
        createAt: DateTime.parse('2024-06-20T12:00:00.000'),
        userId: 'user1',
        isFavorite: true,
      );
      final json = dto.toJson();
      final fromJson = ProblemRequestDto.fromJson(json);
      expect(fromJson, dto);
    });
  });

  group('ProblemResponseDto', () {
    test('toJson/fromJson이 올바르게 동작한다', () {
      final dto = ProblemResponseDto(
        id: 1,
        title: 'title',
        content: 'content',
        isDone: false,
        createAt: DateTime.parse('2024-06-20T12:00:00.000'),
        userId: 'user1',
        isFavorite: true,
        solution: 'solution',
      );
      final json = dto.toJson();
      final fromJson = ProblemResponseDto.fromJson(json);
      expect(fromJson, dto);
    });
    test('기본값이 올바르게 설정된다', () {
      final dto = ProblemResponseDto(
        title: 'title',
        isDone: false,
        createAt: DateTime.parse('2024-06-20T12:00:00.000'),
        userId: 'user1',
        isFavorite: false,
      );
      expect(dto.content, '');
      expect(dto.solution, '');
    });
  });

  group('ProblemUpdateRequestDto', () {
    test('toJson/fromJson이 올바르게 동작한다', () {
      final dto = ProblemUpdateRequestDto(
        id: 1,
        title: 'title',
        content: 'content',
        isDone: true,
        createAt: DateTime.parse('2024-06-20T12:00:00.000'),
        userId: 'user1',
        isFavorite: false,
        solution: 'solution',
      );
      final json = dto.toJson();
      final fromJson = ProblemUpdateRequestDto.fromJson(json);
      expect(fromJson, dto);
    });
  });
}
