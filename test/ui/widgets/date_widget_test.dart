import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solution_diary_app/src/feature/date/ui/widgets/date_widget.dart';

void main() {
  group("DateWidget Test", () {
    testWidgets("2025-3-31일에 대하여 3과 MON이 렌더링된다.", (tester) async {
      final date = DateTime(2025, 3, 31);
      final widget = MaterialApp(
        home: DateWidget(date: date),
      );

      await tester.pumpWidget(widget);

      expect(find.bySemanticsLabel("MON"), findsOneWidget);
      expect(find.bySemanticsLabel("31"), findsOneWidget);
    });

    testWidgets("2025-4-01일에 대하여 1과 TUE이 렌더링된다.", (tester) async {
      final date = DateTime(2025, 4, 1);
      final widget = MaterialApp(
        home: DateWidget(date: date),
      );

      await tester.pumpWidget(widget);

      expect(find.bySemanticsLabel("TUE"), findsOneWidget);
      expect(find.bySemanticsLabel("1"), findsOneWidget);
    });
  });
}
