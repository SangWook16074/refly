import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solution_diary_app/src/feature/problem/data/datasources/problem_api_service.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_response_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_stat_response_dto.dart';
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

    test("전체 고민 목록을 조회하는데 성공하면 사용자의 모든 고민목록을 가져온다.", () async {
      final response = [
        ProblemResponseDto(
            title: "new problem",
            isDone: false,
            createAt: now,
            userId: "uuid1",
            isFavorite: false)
      ];
      when(apiService.fetchAllProblems("uuid1"))
          .thenAnswer((_) async => response);
      final result = await repository.getAllProblems("uuid1");
      expect(result.length, 1);
    });

    test('fetchUserStat returns UserStatResponseDto from service', () async {
      final mockService = MockProblemApiService();
      final repository = ProblemRepositoryImpl(service: mockService);
      const userId = 'test-user';
      const expectedStat = UserStatResponseDto(total: 5, solve: 3, unsolve: 2);
      when(mockService.fetchUserStat(any))
          .thenAnswer((_) async => expectedStat);

      final result = await repository.fetchUserStat(userId);
      expect(result, expectedStat);
    });

    test('deleteProblem: 문제 삭제 API가 정상적으로 호출된다.', () async {
      when(apiService.deleteProblem(1)).thenAnswer((_) async => Future.value());
      await repository.deleteProblem(1);
      verify(apiService.deleteProblem(1)).called(1);
    });

    test('updateProblem: 문제 수정 API가 정상적으로 동작한다.', () async {
      final entity = ProblemEntity(
        id: 1,
        title: "updated problem",
        content: "updated content",
        isDone: true,
        createAt: now,
        userId: "uuid1",
        isFavorite: true,
        solution: "updated solution",
      );
      final response = [
        ProblemResponseDto(
          id: 1,
          title: "updated problem",
          content: "updated content",
          isDone: true,
          createAt: now,
          userId: "uuid1",
          isFavorite: true,
          solution: "updated solution",
        )
      ];
      when(apiService.completeProblem(entity.toUpdateRequest()))
          .thenAnswer((_) async => response);
      final result = await repository.updateProblem(entity);
      expect(result.length, 1);
      expect(result.first.title, "updated problem");
      expect(result.first.isDone, true);
    });

    test('ProblemEntity: props getter가 정상적으로 동작한다', () {
      final entity = ProblemEntity(
        id: 1,
        title: "test",
        content: "content",
        isDone: false,
        createAt: now,
        userId: "uuid1",
        isFavorite: false,
        solution: "solution",
      );
      expect(entity.props, [1, "test", "content", false, now, "uuid1"]);
    });

    // TODO: Add a test for fetchUserStat or updateProblem if not already covered.
  });
}
