import 'package:solution_diary_app/src/core/extensions/date_extension.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("date extension test", () {
    test("2025-03-31은 MON이 반환된다.", () {
      final day = DateTime(2025, 3, 31);
      expect(day.getWeekday, "월");
    });

    test("2025-04-01은 TUE가 반환된다.", () {
      final day = DateTime(2025, 4, 1);
      expect(day.getWeekday, "화");
    });

    test("2025-04-02은 WED가 반환된다.", () {
      final day = DateTime(2025, 4, 2);
      expect(day.getWeekday, "수");
    });

    test("2025-04-03은 THU가 반환된다.", () {
      final day = DateTime(2025, 4, 3);
      expect(day.getWeekday, "목");
    });

    test("2025-04-04은 FRI가 반환된다.", () {
      final day = DateTime(2025, 4, 4);
      expect(day.getWeekday, "금");
    });

    test("2025-04-05은 SAT가 반환된다.", () {
      final day = DateTime(2025, 4, 5);
      expect(day.getWeekday, "토");
    });

    test("2025-04-06은 SUN가 반환된다.", () {
      final day = DateTime(2025, 4, 6);
      expect(day.getWeekday, "일");
    });
  });
}
