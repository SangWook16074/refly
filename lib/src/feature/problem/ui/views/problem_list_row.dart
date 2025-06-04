import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/daily_problem_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_view_event.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_event.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_stat_view_model.dart';

/// 사용자가 등록한 문제를 보여주는 ROW
class ProblemListRow extends HookConsumerWidget {
  final ProblemModel problem;
  final bool initialExpanded;
  const ProblemListRow({
    super.key,
    required this.problem,
    this.initialExpanded = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = useState(initialExpanded);
    final now = ref.watch(dateViewModelProvider);
    final problemListViewModel =
        ref.read(dailyProblemViewModelProvider(target: now).notifier);
    final userStatViewModel = ref.read(userStatViewModelProvider.notifier);
    void showCompleteDialog() {
      showDialog(
          context: context,
          barrierColor: const Color.fromARGB(255, 9, 9, 9).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "문제를 해결처리할까요?",
                confirmLabel: "네",
                cancelLabel: "아니요",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await problemListViewModel.onEvent(
                      UpdateProblem(problem: problem.copyWith(isDone: true)));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              ));
    }

    void showReturnProgressDialog() {
      showDialog(
          context: context,
          barrierColor: const Color.fromARGB(255, 9, 9, 9).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "문제 해결을 취소할까요?",
                confirmLabel: "네",
                cancelLabel: "아니요",
                onConfirm: () async {
                  Navigator.of(context).pop();
                  await problemListViewModel.onEvent(
                      UpdateProblem(problem: problem.copyWith(isDone: false)));
                  userStatViewModel.onEvent(RefreshUserStat());
                },
              ));
    }

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: const Color(0xff000000).withOpacity(.04))
        ]),
        child: ExpansionTile(
          collapsedBackgroundColor: const Color(0xffffffff),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          childrenPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          backgroundColor: const Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          expansionAnimationStyle: AnimationStyle(curve: Curves.easeIn),
          dense: true,
          tilePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
          onExpansionChanged: (value) {
            toggle.value = !toggle.value;
          },
          title: Text(
            problem.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          trailing:

              /// 문제 해결 여부
              ///
              /// 문제가 해결되지 않았을 경우
              /// 문제의 해결상태 변경할 수 있는 다이얼로그를 탭해서 열 수 있음.
              GestureDetector(
            onTap: () {
              if (!problem.isDone) {
                showCompleteDialog();
              } else {
                showReturnProgressDialog();
              }
            },
            child: Container(
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
          ),
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                minHeight: 0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: const BoxDecoration(
                        color: Color(0xffdbdbdb),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      problem.content.isEmpty
                          ? "등록된 상세내용이 없습니다."
                          : problem.content,
                      style: TextStyle(
                        fontSize: 13,
                        color: problem.content.isEmpty
                            ? const Color(0xffafafaf)
                            : const Color(0xff000000),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
