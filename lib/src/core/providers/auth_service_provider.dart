import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/dot_env_provider.dart';
import 'package:solution_diary_app/src/core/providers/google_sign_in_provider.dart';
import 'package:solution_diary_app/src/core/providers/supabase_client_provider.dart';
import 'package:solution_diary_app/src/core/providers/sign_in_with_apple_wrapper_provider.dart';
import 'package:solution_diary_app/src/feature/auth/data/datasources/auth_service.dart';

part 'auth_service_provider.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(Ref ref) {
  return AuthServiceImpl(
    supabase: ref.read(supabaseClientProvider),
    dotenv: ref.read(dotEnvProvider),
    googleSignIn: ref.read(googleSignInProvider),
    signInWithAppleWrapper: ref.read(signInWithAppleWrapperProvider),
  );
}
