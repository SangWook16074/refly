import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:solution_diary_app/src/feature/problem/data/datasources/problem_api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_update_request_dto.dart';
import 'package:solution_diary_app/src/feature/problem/data/dtos/problem_response_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_stat_response_dto.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

void main() {
  group('ProblemApiServiceImpl', () {
    test('fetchProblemsByDate 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('createNewProblem 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('fetchAllProblems 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('fetchSovledProblems 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('fetchUnsolvedProblems 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('fetchUserStat 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('deleteProblem 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
    test('completeProblem 정상 동작 테스트', () async {
      // Supabase 연동 테스트 생략
    });
  });
}
