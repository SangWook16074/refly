import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/feature/auth/data/datasources/auth_service.dart';

part 'sign_in_with_apple_wrapper_provider.g.dart';

@Riverpod(keepAlive: true)
SignInWithAppleWrapper signInWithAppleWrapper(Ref ref) =>
    DefaultSignInWithAppleWrapper();
