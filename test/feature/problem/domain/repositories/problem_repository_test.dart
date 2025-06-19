import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solution_diary_app/src/feature/problem/data/datasources/problem_api_service.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_response_dto.dart';
import 'package:solution_diary_app/src/feature/problem/domain/entities/problem_entity.dart';
import 'package:solution_diary_app/src/feature/problem/domain/repositories/problem_repository.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'problem_repository_test.mocks.dart';

/// [ProblemRepository] 단위 테스트
///
///
@GenerateNiceMocks([MockSpec<ProblemApiService>()])
void main() {
  group("problem repository unit test", () {
    late ProblemApiService apiService;
    late ProblemRepository repository;
    final now = DateTime(2025, 6, 19);
    setUp(() {
      apiService = MockProblemApiService();
      repository = ProblemRepositoryImpl(service: apiService);
    });
    test("날짜별 고민 목록 조회를 성공하면 그날의 고민 목록이 반환된다.", () async {
      final response = [
        ProblemResponseDto(
            title: "new problem",
            isDone: false,
            createAt: now,
            userId: "uuid1",
            isFavorite: false)
      ];
      when(apiService.fetchProblemsByDate(now, "uuid1"))
          .thenAnswer((_) async => response);
      final result = await repository.fetchProblemsByDate(now, 'uuid1');
      expect(result.length, 1);
    });

    test("새로운 고민을 생성하면 생성된 고민을 다시 반환한다.", () async {
      final entity = ProblemEntity(
          id: null,
          title: "new problem",
          content: "content",
          isDone: false,
          createAt: now,
          userId: "uuid1",
          isFavorite: false,
          solution: "");

      when(apiService.createNewProblem(entity.toRequest())).thenAnswer(
          (_) async =>
              [ProblemResponseDto.fromJson(entity.toRequest().toJson())]);
      final result = await repository.createNewProblem(entity);
      expect(result.length, 1);
    });
  });
}
