import 'dart:developer';

import 'package:solution_diary_app/src/feature/main/data/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/feature/main/data/dtos/problem_update_request_dto.dart';
import 'package:solution_diary_app/src/feature/main/data/dtos/user_stat_response_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../dtos/problem_response_dto.dart';

class ProblemApiServiceImpl implements ProblemApiService {
  final SupabaseClient client;
  ProblemApiServiceImpl({required this.client});

  @override
  Future<List<ProblemResponseDto>> createNewProblem(
      ProblemRequestDto dto) async {
    final data = await client.from("solution").insert(dto.toJson()).select();
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  @override
  Future<List<ProblemResponseDto>> fetchProblemsByDate(
      DateTime date, String userId) async {
    try {
      final target = date;
      final next = target.add(const Duration(days: 1));
      final data = await client
          .from("solution")
          .select()
          .eq("user_id", userId)
          .gte("created_at", target.toIso8601String())
          .lt("created_at", next.toIso8601String());

      return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ProblemResponseDto>> fetchAllProblems(String userId) async {
    final data = await client.from("solution").select();
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  @override
  Future<List<ProblemResponseDto>> fetchSovledProblems(String userId) async {
    final data = await client.from("solution").select().eq("is_done", true);
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  @override
  Future<List<ProblemResponseDto>> fetchUnsolvedProblems(String userId) async {
    final data = await client.from("solution").select().eq("is_done", false);
    return data.map((json) => ProblemResponseDto.fromJson(json)).toList();
  }

  /// 사용자의 현재까지 해결 기록 스탯을 반환하는 RPC 쿼리
  @override
  Future<UserStatResponseDto> fetchUserStat() async {
    try {
      final data = await client.rpc("user_stat_count");
      return UserStatResponseDto.fromJson(data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// 사용자 기록 삭제 API
  @override
  Future<void> deleteProblem(int id) async {
    await client.from("solution").delete().eq("id", id);
  }

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

  Future<UserStatResponseDto> fetchUserStat();

  Future<void> deleteProblem(int id);

  Future<List<ProblemResponseDto>> completeProblem(ProblemUpdateRequestDto dto);
}
