import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';

class DateSelectButton extends StatelessWidget {
  final String date;
  const DateSelectButton({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconImageWidget(path: ImagePath.calendar),
          const SizedBox(
            width: 10,
          ),
          Text(
            date,
            style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xffffffff)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconImageWidget(path: ImagePath.arrowDown),
          ),
        ],
      ),
    );
  }
}
