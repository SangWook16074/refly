import 'dart:developer';

import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_update_request_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_stat_response_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../dtos/problem_response_dto.dart';

/// 사용자 고민 관련 Api 엔드포인트
///
///
class ProblemApiServiceImpl implements ProblemApiService {
  final SupabaseClient client;
  ProblemApiServiceImpl({required this.client});

  /// 날짜별 사용자의 고민목록 조회 Api
  ///
  ///
  @override
  Future<List<ProblemResponseDto>> fetchProblemsByDate(
      DateTime date, String userId) async {
    final target = date;
    final next = target.add(const Duration(days: 1));
    final data = await client
        .from("solution")
        .select()
        .eq("user_id", userId)
        .gte("created_at", target.toIso8601String())
        .lt("created_at", next.toIso8601String());

    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  /// 사용자 고민 생성 Api
  ///
  ///
  @override
  Future<List<ProblemResponseDto>> createNewProblem(
      ProblemRequestDto dto) async {
    final data = await client.from("solution").insert(dto.toJson()).select();
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  /// 모든 사용자 고민 목록 조회 Api
  ///
  ///
  @override
  Future<List<ProblemResponseDto>> fetchAllProblems(String userId) async {
    final data = await client.from("solution").select().eq("user_id", userId);
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  /// 모든 사용자의 해결된 고민 조회 Api
  ///
  ///
  @override
  Future<List<ProblemResponseDto>> fetchSovledProblems(String userId) async {
    final data = await client.from("solution").select().eq("is_done", true);
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  /// 모든 사용자의 해결되지 않은 고민 조회 Api
  ///
  ///
  @override
  Future<List<ProblemResponseDto>> fetchUnsolvedProblems(String userId) async {
    final data = await client.from("solution").select().eq("is_done", false);
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  /// 사용자의 현재까지 해결 기록 스탯을 반환하는 RPC 쿼리
  ///
  ///
  @override
  Future<UserStatResponseDto> fetchUserStat(String userId) async {
    final data =
        await client.rpc("get_solution_stats", params: {"p_user_id": userId});
    return UserStatResponseDto.fromJson(data);
  }

  /// 사용자 기록 삭제 API
  ///
  ///
  @override
  Future<void> deleteProblem(int id) async {
    await client.from("solution").delete().eq("id", id);
  }

  /// 사용자 고민 해결 처리 Api
  ///
  ///
  @override
  Future<List<ProblemResponseDto>> completeProblem(
      ProblemUpdateRequestDto dto) async {
    final data = await client
        .from("solution")
        .update(dto.toJson())
        .eq("id", dto.id)
        .select();
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }
}

abstract class ProblemApiService {
  Future<List<ProblemResponseDto>> fetchProblemsByDate(
      DateTime date, String userId);

  Future<List<ProblemResponseDto>> createNewProblem(ProblemRequestDto dto);

  Future<List<ProblemResponseDto>> fetchAllProblems(String userId);

  Future<List<ProblemResponseDto>> fetchUnsolvedProblems(String userId);

  Future<List<ProblemResponseDto>> fetchSovledProblems(String userId);

  Future<UserStatResponseDto> fetchUserStat(String userId);

  Future<void> deleteProblem(int id);

  Future<List<ProblemResponseDto>> completeProblem(ProblemUpdateRequestDto dto);
}
