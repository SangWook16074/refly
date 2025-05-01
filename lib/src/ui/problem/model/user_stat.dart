import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stat.freezed.dart';
part 'user_stat.g.dart';

@freezed
sealed class UserStat with _$UserStat {
  const factory UserStat({
    @Default(0) int total,
    @Default(0) int solve,
    @Default(0) int unsolve,
  }) = _UserStat;

  factory UserStat.fromJson(Map<String, dynamic> json) =>
      _$UserStatFromJson(json);
}
