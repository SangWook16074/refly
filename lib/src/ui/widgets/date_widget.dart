import 'package:flutter/material.dart';
import 'package:solution_diary_app/core/extensions/date_extension.dart';

/// 날짜를 표시하는 위젯
class DateWidget extends StatelessWidget {
  final DateTime date;
  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffffffff),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
  }
}
