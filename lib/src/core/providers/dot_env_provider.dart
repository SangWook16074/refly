import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dot_env_provider.g.dart';

@Riverpod(keepAlive: true)
DotEnv dotEnv(Ref ref) => DotEnv();
