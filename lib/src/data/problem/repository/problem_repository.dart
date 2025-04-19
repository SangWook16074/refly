import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/data/problem/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final problemRepositoryProvider = Provider((Ref ref) => ProblemRepository());

class ProblemRepository {
  final client = Supabase.instance.client;

  Future<List<Problem>> getAllProblems() async {
    final data = await client.from("solution").select();
    return data.map((json) => Problem.fromJson(json)).toList();
  }

  Future<List<Problem>> createProblem(ProblemRequestDto problem) async {
    final data =
        await client.from("solution").insert(problem.toJson()).select();

    return data.map((json) => Problem.fromJson(json)).toList();
  }
}
