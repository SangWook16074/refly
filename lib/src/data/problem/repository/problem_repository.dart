import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'problem_repository.g.dart';

@riverpod
Future<List<Problem>> getAllProblems(Ref ref) async {
  final client = Supabase.instance.client;
  final data = await client.from("solution").select();
  return data.map((json) => Problem.fromJson(json)).toList();
}
