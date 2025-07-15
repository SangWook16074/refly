import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solution_diary_app/src/feature/user/domain/repositories/user_repository.dart';
import 'package:solution_diary_app/src/feature/user/data/datasources/user_api_service.dart';
import 'package:solution_diary_app/src/feature/user/data/datasources/edge_function_service.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_request_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_response_dto.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_agreement_state_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([UserApiService, EdgeFunctionService, User])
void main() {
  group('UserRepositoryImpl', () {
    late MockUserApiService mockUserApiService;
    late MockEdgeFunctionService mockEdgeFunctionService;
    late UserRepositoryImpl repository;

    setUp(() {
      mockUserApiService = MockUserApiService();
      mockEdgeFunctionService = MockEdgeFunctionService();
      repository = UserRepositoryImpl(
          service: mockUserApiService,
          edgeFunctionService: mockEdgeFunctionService);
    });

    test('getUser 정상 동작 테스트', () async {
      final mockUser = MockUser();
      when(mockUserApiService.getUser()).thenReturn(mockUser);
      final result = repository.getUser();
      expect(result, mockUser);
      verify(mockUserApiService.getUser()).called(1);
    });

    test('deleteUser 정상 동작 테스트', () async {
      when(mockEdgeFunctionService.deleteUserViaEdgeFunction(any))
          .thenAnswer((_) async => {});
      await repository.deleteUser('test-uid');
      verify(mockEdgeFunctionService.deleteUserViaEdgeFunction(any)).called(1);
    });

    test('getUserAgreementState 정상 동작 테스트', () async {
      const responseDto = UserAgreementResponseDto(hasconsentedtopolicy: true);
      when(mockUserApiService.getUserAgreementState(any))
          .thenAnswer((_) async => responseDto);
      final result = await repository.getUserAgreementState('test-uid');
      expect(result.hasconsentedtopolicy, true);
      verify(mockUserApiService.getUserAgreementState(any)).called(1);
    });

    test('updateUserAgreementState 정상 동작 테스트', () async {
      when(mockUserApiService.updateUserAgreementState(any, any))
          .thenAnswer((_) async => {});
      await repository.updateUserAgreementState('test-uid');
      verify(mockUserApiService.updateUserAgreementState(any, any)).called(1);
    });
  });
}
