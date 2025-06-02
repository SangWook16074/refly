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
              color: switch (type) {
                SelectType.select => const Color(0xff3C518A),
                _ => const Color(0xff575757)
              },
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
