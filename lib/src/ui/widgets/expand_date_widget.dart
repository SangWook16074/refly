import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/ui/widgets/date_widget.dart';

extension on DateTime {
  isEqualtTo(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}

class ExpandDateWidget extends StatelessWidget {
  final DateTime now;
  final DateTime currDate;
  final ScrollController? controller;
  final ValueSetter<DateTime> onTap;
  const ExpandDateWidget({
    super.key,
    required this.now,
    this.controller,
    required this.currDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const totalDays = 10000;

    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      reverse: true,
      itemCount: totalDays,
      itemBuilder: (context, index) {
        final date = now.subtract(Duration(days: index));
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              onTap(date);
            },
            child: DateWidget(
              date: date,
              type: (date.isEqualtTo(currDate))
                  ? SelectType.select
                  : SelectType.unselect,
            ),
          ),
        );
      },
    );
  }
}
