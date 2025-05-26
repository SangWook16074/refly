import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/supabase_client_provider.dart';
import 'package:solution_diary_app/src/feature/main/data/datasources/user_api_service.dart';

part 'user_api_service_provider.g.dart';

@Riverpod(keepAlive: true)
UserApiService userApiService(Ref ref) {
  return UserApiServiceImpl(client: ref.read(supabaseClientProvider));
}
