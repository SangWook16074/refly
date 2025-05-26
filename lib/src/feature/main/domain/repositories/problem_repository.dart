import 'package:solution_diary_app/src/feature/main/data/datasources/problem_api_service.dart';
import 'package:solution_diary_app/src/feature/main/data/dtos/user_stat_response_dto.dart';
import 'package:solution_diary_app/src/feature/main/domain/entities/problem_entity.dart';

// class ProblemRepository {
//   final SupabaseClient client;
//   ProblemRepository({required this.client});

//   /// 사용자가 서버에 저장한 모든 기록을 불러옵니다.
//   Future<List<Problem>> getAllProblems() async {
// final user = client.auth.currentUser;

//     if (user != null) {
//       final data =
//           await client.from("solution").select().eq("user_id", user.id);
//       print(data);
//       return data.map((json) => Problem.fromJson(json)).toList();
//     } else {
//       return [];
//     }
//   }

//   /// 사용자의 오늘 기록 fetch함수
//   Future<List<Problem>> fetchInitalProblems(DateTime date) async {

//   }

//   /// 사용자가 서버에 새로운 기록을 저장합니다.
//   Future<List<Problem>> createProblem(ProblemRequestDto problem) async {
//     final user = client.auth.currentUser;
//     final json = {};
//     json.addAll(problem.toJson());
//     json.addAll({"user_id": client.auth.currentUser?.id});

//   }

//   /// 사용자가 서버에 저장한 기록 중 해결되지 않은 기록만을 불러옵니다.
//   Future<List<Problem>> getAllUnresolvedProblems() async {
//     final data = await client.from("solution").select().eq("is_done", false);
//     return data.map((json) => Problem.fromJson(json)).toList();
//   }

//   /// 사용자가 저장한 기록 중 서버로부터 특정 기록을 삭제합니다.
//   Future<void> deleteProblem(int id) async {
//     await client.from("solution").delete().eq("id", id);
//   }

// }

/// [Problem]의 Repository 클래스
///
///
final class ProblemRepositoryImpl implements ProblemRepository {
  final ProblemApiService service;
  ProblemRepositoryImpl({required this.service});

  /// 날짜에 따른 사용자의 문제 목록 패치 API
  ///
  /// 전달받은 날짜와 사용자의 ID를 통해 해당 날짜에 등록한 문제 목록을 서버로부터 불러옵니다.
  @override
  Future<List<ProblemEntity>> fetchProblemsByDate(
      DateTime date, String userId) async {
    final response = await service.fetchProblemsByDate(date, userId);
    return response
        .map((res) => ProblemEntity(
            id: res.id,
            title: res.title,
            content: res.content,
            isDone: res.isDone,
            createAt: res.createAt,
            uid: res.uid))
        .toList();
  }

  /// 새로운 문제 생성 API
  ///
  /// 전달받은 데이터를 통해 서버에 사용자의 새로운 문제를 생성합니다.
  @override
  Future<List<ProblemEntity>> createNewProblem(ProblemEntity problem) async {
    final response = await service.createNewProblem(problem.toRequest());
    return response
        .map((res) => ProblemEntity(
            id: res.id,
            title: res.title,
            content: res.content,
            isDone: res.isDone,
            createAt: res.createAt,
            uid: res.uid))
        .toList();
  }

  /// 사용자의 모든 문제 GET API
  ///
  /// 사용자가 등록한 모든 문제를 불러옵니다.

  @override
  Future<List<ProblemEntity>> getAllProblems(String userId) async {
    final response = await service.fetchAllProblems(userId);
    return response
        .map((res) => ProblemEntity(
            id: res.id,
            title: res.title,
            content: res.content,
            isDone: res.isDone,
            createAt: res.createAt,
            uid: res.uid))
        .toList();
  }

  /// 사용자의 모든 해결 완료 문제 GET API
  ///
  /// 사용자가 등록한 모든 해결완료된 문제를 불러옵니다.
  @override
  Future<List<ProblemEntity>> getAllSolvedProblems(String userId) async {
    final response = await service.fetchAllProblems(userId);
    return response
        .map((res) => ProblemEntity(
            id: res.id,
            title: res.title,
            content: res.content,
            isDone: res.isDone,
            createAt: res.createAt,
            uid: res.uid))
        .toList();
  }

  /// 사용자의 미해결 문제 GET API
  ///
  /// 사용자가 아직 해결하지 않은 모든 문제를 불러옵니다.
  @override
  Future<List<ProblemEntity>> getAllUnresolvedProblems(String userId) async {
    final response = await service.fetchAllProblems(userId);
    return response
        .map((res) => ProblemEntity(
            id: res.id,
            title: res.title,
            content: res.content,
            isDone: res.isDone,
            createAt: res.createAt,
            uid: res.uid))
        .toList();
  }

  /// 사용자의 문제 삭제 API
  ///
  /// 사용자가 해결 여부와 관련없이 서버로부터 해당 ID에 맞는 데이터를 삭제합니다.
  @override
  Future<void> deleteProblem(int id) {
    // TODO: implement deleteProblem
    throw UnimplementedError();
  }

  @override
  Future<UserStatResponseDto> fetchUserStat() async {
    return service.fetchUserStat();
  }
}

abstract class ProblemRepository {
  Future<List<ProblemEntity>> fetchProblemsByDate(DateTime date, String userId);

  Future<List<ProblemEntity>> createNewProblem(ProblemEntity problem);

  Future<List<ProblemEntity>> getAllProblems(String userId);

  Future<List<ProblemEntity>> getAllUnresolvedProblems(String userId);

  Future<List<ProblemEntity>> getAllSolvedProblems(String userId);

  Future<void> deleteProblem(int id);

  Future<UserStatResponseDto> fetchUserStat();
}
