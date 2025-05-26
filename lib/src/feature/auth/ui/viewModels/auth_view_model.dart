import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_view_model.g.dart';

@riverpod
Stream<AuthState> authState(Ref ref) {
  final supabase = Supabase.instance.client;
  return supabase.auth.onAuthStateChange;
}
