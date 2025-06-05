import 'package:flutter/material.dart';

/// 사용자가 등록한 문제를 보여주는 ROW
class ProblemListRow extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final void Function()? onTrailing;
  const ProblemListRow({super.key, this.title, this.trailing, this.onTrailing})
      : assert(trailing != null || !(onTrailing != null),
            "trailing 위젯을 반드시 전달해야 onTrailing을 전달할 수 있습니다.");

  @override
  Widget build(
    BuildContext context,
  ) {
    // void showCompleteDialog() {
    //   showDialog(
    //       context: context,
    //       barrierColor: const Color.fromARGB(255, 9, 9, 9).withOpacity(.1),
    //       builder: (context) => CustomDialog(
    //             content: "문제를 해결처리할까요?",
    //             confirmLabel: "네",
    //             cancelLabel: "아니요",
    //             onConfirm: () async {
    //               Navigator.of(context).pop();
    //               await problemListViewModel.onEvent(
    //                   UpdateProblem(problem: problem.copyWith(isDone: true)));
    //               userStatViewModel.onEvent(RefreshUserStat());
    //             },
    //           ));
    // }

    // void showReturnProgressDialog() {
    //   showDialog(
    //       context: context,
    //       barrierColor: const Color.fromARGB(255, 9, 9, 9).withOpacity(.1),
    //       builder: (context) => CustomDialog(
    //             content: "문제 해결을 취소할까요?",
    //             confirmLabel: "네",
    //             cancelLabel: "아니요",
    //             onConfirm: () async {
    //               Navigator.of(context).pop();
    //               await problemListViewModel.onEvent(
    //                   UpdateProblem(problem: problem.copyWith(isDone: false)));
    //               userStatViewModel.onEvent(RefreshUserStat());
    //             },
    //           ));
    // }

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: const Color(0xff000000).withOpacity(.04))
            ]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              trailing ?? Container()
            ],
          )
        ]));
  }
}
