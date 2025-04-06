import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/ui/widgets/date_widget.dart';

class ExpandDateWidget extends StatelessWidget {
  final DateTime now;
  const ExpandDateWidget({super.key, required this.now});

  @override
  Widget build(BuildContext context) {
    const totalDays = 10000;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      reverse: true,
      itemCount: totalDays,
      itemBuilder: (context, index) {
        final date = now.subtract(Duration(days: index));
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DateWidget(
            date: date,
            type: (date == now) ? SelectType.select : SelectType.unselect,
          ),
        );
      },
    );
  }
}
