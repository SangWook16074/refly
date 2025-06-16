import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_request_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_response_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class UserApiServicesImpl implements UserApiServices {
  final SupabaseClient client;

  UserApiServicesImpl({required this.client});

  /// 개인 정보 수집 동의 여부
  @override
  Future<UserAgreementResponseDto> getUserAgreementState(String uid) async {
    final response = await client
        .from("users")
        .select("hasconsentedtopolicy")
        .eq("uid", uid)
        .limit(1);
    return UserAgreementResponseDto.fromJson(response.first);
  }

  /// 개인 정보 수집 동의
  @override
  Future<void> updateUserAgreementState(UserAgreementRequestDto dto) async {
    await client.from("users").insert(dto.toJson());
  }
}

abstract class UserApiServices {
  Future<UserAgreementResponseDto> getUserAgreementState(String uid);

  Future<void> updateUserAgreementState(UserAgreementRequestDto dto);
}
