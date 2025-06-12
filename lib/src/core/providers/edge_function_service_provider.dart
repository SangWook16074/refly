import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/feature/user/data/datasources/edge_function_service.dart';
import 'package:http/http.dart' as http;

part 'edge_function_service_provider.g.dart';

@riverpod
EdgeFunctionService edgeFunctionService(Ref ref) {
  return EdgeFunctionServiceImpl(client: http.Client());
}
