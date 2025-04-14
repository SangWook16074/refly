import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';

/// 사용자가 등록한 문제를 보여주는 ROW
class ProblemListRow extends StatelessWidget {
  final Problem problem;
  const ProblemListRow({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: const Color(0xff000000).withOpacity(.04))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 문제 제목
          Text(problem.title),

          /// 문제 해결 여부
          ///
          /// 문제가 해결되지 않았을 경우
          /// 문제의 해결상태 변경할 수 있는 다이얼로그를 탭해서 열 수 있음.
          Container(
            width: 30,
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: (problem.isDone)
                  ? const Color(0xff57D364)
                  : const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
