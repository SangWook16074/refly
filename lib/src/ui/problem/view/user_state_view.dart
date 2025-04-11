import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/ui/widgets/progress_widget.dart';
import 'package:solution_diary_app/src/ui/widgets/state_detail_widget.dart';

class UserStateView extends StatelessWidget {
  final double height;
  const UserStateView({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
          color: const Color(0xffffffff).withOpacity(.15),
          borderRadius: BorderRadius.circular(12.0)),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: StateDetailWidget(label: "전체", count: 10)),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: StateDetailWidget(label: "완료", count: 7)),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: StateDetailWidget(label: "진행중", count: 3)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ProgressWidget(
              total: 10,
              current: 7,
              height: height / 3,
            ),
          ),
        ],
      ),
    );
  }
}
