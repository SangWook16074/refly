import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solution_diary_app/src/feature/main/domain/entities/user_stat.dart';

part 'user_stat_response_dto.freezed.dart';
part 'user_stat_response_dto.g.dart';

@freezed
abstract class UserStatResponseDto with _$UserStatResponseDto {
  const factory UserStatResponseDto({
    @Default(0) int total,
    @Default(0) int solve,
    @Default(0) int unsolve,
  }) = _UserStatResponseDto;

  factory UserStatResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserStatResponseDtoFromJson(json);
}
