import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stat.freezed.dart';

@freezed
abstract class UserStat with _$UserStat {
  const factory UserStat({
    required int total,
    required int solve,
    required int unsolve,
  }) = _UserStat;

  const UserStat._();

  int get userResolutionRate {
    if (total == 0) {
      return 0;
    }
    return (solve / total * 100).round();
  }
}
