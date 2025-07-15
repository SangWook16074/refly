import 'package:flutter_test/flutter_test.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_stat_response_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_request_dto.dart';
import 'package:solution_diary_app/src/feature/user/data/dtos/user_agreement_response_dto.dart';

void main() {
  group('UserStatResponseDto', () {
    test('toJson/fromJson이 올바르게 동작한다', () {
      const dto = UserStatResponseDto(total: 10, solve: 7, unsolve: 3);
      final json = dto.toJson();
      final fromJson = UserStatResponseDto.fromJson(json);
      expect(fromJson, dto);
    });
  });

  group('UserAgreementRequestDto', () {
    test('toJson/fromJson이 올바르게 동작한다', () {
      final now = DateTime.parse('2024-06-20T12:00:00.000');
      final dto = UserAgreementRequestDto(
        hasconsentedtopolicy: true,
        agreedat: now,
      );
      final json = dto.toJson();
      final fromJson = UserAgreementRequestDto.fromJson(json);
      expect(fromJson, dto);
    });
  });

  group('UserAgreementResponseDto', () {
    test('toJson/fromJson이 올바르게 동작한다', () {
      const dto = UserAgreementResponseDto(
        hasconsentedtopolicy: false,
      );
      final json = dto.toJson();
      final fromJson = UserAgreementResponseDto.fromJson(json);
      expect(fromJson, dto);
    });
  });
}
