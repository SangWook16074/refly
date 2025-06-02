import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/supabase_client_provider.dart';
import 'package:solution_diary_app/src/feature/problem/data/datasources/problem_api_service.dart';

part 'problem_api_service_provider.g.dart';

@Riverpod(keepAlive: true)
ProblemApiService problemApiService(Ref ref) {
  return ProblemApiServiceImpl(client: ref.read(supabaseClientProvider));
}
