import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';

class CalendarWidget extends HookWidget {
  final DateTime currDate;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final ValueSetter<DateTime>? onDateChange;
  const CalendarWidget(
      {super.key,
      this.padding,
      this.margin,
      required this.currDate,
      this.onDateChange});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final year = useState<int>(currDate.year);
    final month = useState<int>(currDate.month);
    final selectedDay = useState<DateTime>(currDate);
    final weekDay = DateUtils.firstDayOffset(
        year.value, month.value, MaterialLocalizations.of(context));
    final end = DateUtils.getDaysInMonth(year.value, month.value);
    bool isRightAbled =
        now.year >= year.value + 1 || now.month >= month.value + 1;
    void onPrevMonthTap() {
      month.value -= 1;
      if (month.value == 0) {
        year.value -= 1;
        month.value = 12;
      }
    }

    void onNextMonthTap() {
      if (!isRightAbled) return;
      month.value += 1;
      if (month.value == 13) {
        year.value += 1;
        month.value = 1;
      }
    }

    return Container(
      margin: margin,
      padding: padding,
      constraints: const BoxConstraints(maxHeight: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xfff3f3f3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 상단 라벨 위젯
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onPrevMonthTap,
                child: SizedBox(
                    width: 24,
                    child: IconImageWidget(path: ImagePath.arrowLeft)),
              ),
              SizedBox(
                width: 110,
                height: 21,
                child: Center(
                  child: Text(
                    "${year.value}년 ${month.value}월",
                    style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onNextMonthTap,
                child: SizedBox(
                    width: 24,
                    child: IconImageWidget(
                        path: isRightAbled
                            ? ImagePath.arrowRight
                            : ImagePath.arrowRightDisable)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ["일", "월", "화", "수", "목", "금", "토"]
                        .map((label) => Text(
                              label,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: label == "일"
                                      ? const Color(0xffff4e4e)
                                      : const Color(0xff000025)),
                            ))
                        .toList()),
                ...List.generate(
                    6,
                    (y) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(7, (x) {
                            final offset = 7 * y + x;
                            final day = (offset - weekDay + 1);
                            return SizedBox(
                              width: 26,
                              child: offset < weekDay || day > end
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        final newDate = DateTime(
                                            year.value, month.value, day);

                                        if (!newDate.isAfter(now)) {
                                          selectedDay.value = newDate;
                                          log(selectedDay.value.toString());
                                          onDateChange!(newDate);
                                        }
                                      },
                                      child: Center(
                                        child: Container(
                                          width: 23,
                                          height: 23,
                                          decoration: BoxDecoration(
                                              color: selectedDay.value.year ==
                                                          year.value &&
                                                      selectedDay.value.month ==
                                                          month.value &&
                                                      selectedDay.value.day ==
                                                          day
                                                  ? const Color(0xff000025)
                                                      .withAlpha(
                                                          (255 * 0.7).round())
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            day.toString(),
                                            style: TextStyle(
                                                color: Color(
                                                        DateUtils.isSameDay(
                                                                selectedDay
                                                                    .value,
                                                                DateTime(
                                                                    year.value,
                                                                    month.value,
                                                                    day))
                                                            ? 0xfff3f3f3
                                                            : switch (x) {
                                                                0 => 0xffff4e4e,
                                                                _ => 0xff000025,
                                                              })
                                                    .withAlpha(now.year <=
                                                                year.value &&
                                                            now.month <=
                                                                month.value &&
                                                            now.day < day
                                                        ? (255 * 0.3).round()
                                                        : 255),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                            );
                          }),
                        ))
              ]
                  .map((r) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: r,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
