import 'package:solution_diary_app/src/feature/user/domain/entities/user_agreement_state_entity.dart';
import 'package:solution_diary_app/src/feature/user/data/datasources/edge_function_service.dart';
import 'package:solution_diary_app/src/feature/user/data/datasources/user_api_service.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_request_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserApiService service;
  final EdgeFunctionService edgeFunctionService;
  const UserRepositoryImpl(
      {required this.service, required this.edgeFunctionService});

  @override
  User? getUser() {
    return service.getUser();
  }

  @override
  Future<void> deleteUser(String uid) async {
    await edgeFunctionService.deleteUserViaEdgeFunction(uid);
  }

  @override
  Future<UserAgreementStateEntity> getUserAgreementState(String uid) async {
    return service
        .getUserAgreementState(uid)
        .then((response) => UserAgreementStateEntity.fromResponse(response));
  }

  @override
  Future<void> updateUserAgreementState(String uid) async {
    final now = DateTime.now();
    final UserAgreementRequestDto dto = UserAgreementRequestDto(agreedat: now);
    await service.updateUserAgreementState(uid, dto);
  }
}

abstract class UserRepository {
  User? getUser();

  Future<void> deleteUser(String uid);

  Future<UserAgreementStateEntity> getUserAgreementState(String uid);

  Future<void> updateUserAgreementState(String uid);
}
