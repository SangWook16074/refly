import 'package:flutter_test/flutter_test.dart';
import 'package:solution_diary_app/src/feature/user/domain/entities/user_stat.dart';

void main() {
  group('UserStat userResolutionRate', () {
    test('total이 0이면 0을 반환한다', () {
      const stat = UserStat(total: 0, solve: 0, unsolve: 0);
      expect(stat.userResolutionRate, 0);
    });
    test('solve가 0이면 0을 반환한다', () {
      const stat = UserStat(total: 10, solve: 0, unsolve: 10);
      expect(stat.userResolutionRate, 0);
    });
    test('solve가 total과 같으면 100을 반환한다', () {
      const stat = UserStat(total: 10, solve: 10, unsolve: 0);
      expect(stat.userResolutionRate, 100);
    });
    test('solve가 일부면 올바른 비율을 반환한다', () {
      const stat = UserStat(total: 8, solve: 6, unsolve: 2);
      expect(stat.userResolutionRate, (6 / 8 * 100).round());
    });
  });
}
