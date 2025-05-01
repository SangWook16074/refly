import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/data/problem/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/ui/problem/model/user_stat.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final problemRepositoryProvider = Provider((Ref ref) => ProblemRepository());

/// [Problem]의 Repository 클래스
///
///
class ProblemRepository {
  final client = Supabase.instance.client;

  /// 사용자가 서버에 저장한 모든 기록을 불러옵니다.
  Future<List<Problem>> getAllProblems() async {
    final data = await client.from("solution").select();
    return data.map((json) => Problem.fromJson(json)).toList();
  }

  /// 사용자의 오늘 기록 fetch함수
  Future<List<Problem>> fetchInitalProblems(DateTime date) async {
    try {
      final target = date;
      final next = target.add(const Duration(days: 1));
      final data = await client
          .from("solution")
          .select()
          .gte("created_at", target.toIso8601String())
          .lt("created_at", next.toIso8601String());
      return data.map((json) => Problem.fromJson(json)).toList();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /// 사용자가 서버에 새로운 기록을 저장합니다.
  Future<List<Problem>> createProblem(ProblemRequestDto problem) async {
    final data =
        await client.from("solution").insert(problem.toJson()).select();

    return data.map((json) => Problem.fromJson(json)).toList();
  }

  /// 사용자가 서버에 저장한 기록 중 해결되지 않은 기록만을 불러옵니다.
  Future<List<Problem>> getAllUnresolvedProblems() async {
    final data = await client.from("solution").select().eq("is_done", false);
    return data.map((json) => Problem.fromJson(json)).toList();
  }

  /// 사용자가 저장한 기록 중 서버로부터 특정 기록을 삭제합니다.
  Future<void> deleteProblem(int id) async {
    await client.from("solution").delete().eq("id", id);
  }

  /// 사용자의 현재까지 해결 기록 스탯을 반환하는 RPC 쿼리
  Future<UserStat> getUserStat() async {
    try {
      final data = await client.rpc("user_stat_count");
      return UserStat.fromJson(data);
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
