import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';

extension on DateTime {
  String toTitle() => "$year년 $month월 $day일 기록";
}

class ProblemDetailSheet extends StatelessWidget {
  final ProblemModel problem;
  const ProblemDetailSheet({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: bottomInset + bottomSafeArea + 20),
            decoration: const BoxDecoration(
                color: Color(0xffE9EAEF),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Opacity(
                      opacity: 0,
                      child: Icon(
                        Icons.close,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      problem.createAt.toTitle(),
                      style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: const Icon(
                        Icons.close,
                        color: Color(0xff000000),
                      ),
                    )
                  ],
                ),
                Text(
                  problem.title,
                  style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                      color: Color(0xff303030),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
