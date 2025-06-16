import 'dart:developer';

import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_request_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_response_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserApiServiceImpl implements UserApiService {
  final SupabaseClient client;
  UserApiServiceImpl({required this.client});

  /// 현재 유저 정보
  @override
  User? getUser() {
    return client.auth.currentUser;
  }

  /// 개인 정보 수집 동의 여부
  @override
  Future<UserAgreementResponseDto> getUserAgreementState(String uid) async {
    try {
      final response = await client
          .from("users")
          .select("hasconsentedtopolicy")
          .eq("uid", uid)
          .limit(1);
      if (response.isEmpty) {
        return const UserAgreementResponseDto(hasconsentedtopolicy: false);
      }
      return UserAgreementResponseDto.fromJson(response.first);
    } catch (e) {
      log(e.toString());
      throw Exception("통신이 원할하지 않습니다.");
    }
  }

  /// 개인 정보 수집 동의
  @override
  Future<void> updateUserAgreementState(
      String uid, UserAgreementRequestDto dto) async {
    try {
      await client.from("users").update(dto.toJson()).eq("uid", uid);
    } catch (e) {
      log(e.toString());

      throw Exception("통신이 원할하지 않습니다.");
    }
  }
}

abstract class UserApiService {
  User? getUser();

  Future<UserAgreementResponseDto> getUserAgreementState(String uid);

  Future<void> updateUserAgreementState(
      String uid, UserAgreementRequestDto dto);
}
