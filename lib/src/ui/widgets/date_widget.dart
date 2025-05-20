import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/core/extensions/date_extension.dart';

enum SelectType { select, unselect }

/// 날짜를 표시하는 위젯
///
class DateWidget extends StatelessWidget {
  final DateTime date;
  final SelectType type;

  const DateWidget({
    super.key,
    required this.date,
    this.type = SelectType.select,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) { SelectType.unselect => _unSelect(), _ => _select() };
  }

  Widget _unSelect() => Builder(builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final length = (width - 16 * 6) / 6;
        return Container(
          width: length,
          height: length,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffffffff)),
            borderRadius: BorderRadius.circular(4),
            color: Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              Text(
                date.getWeekday,
                style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: Color(0xffffffff)),
              )
            ],
          ),
        );
      });

  Widget _select() => Builder(builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        final size = MediaQuery.of(context).size;
        final width = (size.width - 16 * 6) / 6;
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xffffffff),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.tertiary,
                ),
              ),
              Text(
                date.getWeekday,
                style: const TextStyle(fontFamily: "Roboto", fontSize: 10),
              )
            ],
          ),
        );
      });
}
