import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_text_field.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_update_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_update_view_model.dart';

class ProblemCompleteUploadSheet extends HookConsumerWidget {
  final ProblemModel problem;
  final void Function(ProblemModel) onCompleteTap;
  const ProblemCompleteUploadSheet(
      {super.key, required this.problem, required this.onCompleteTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = problemUpdateViewModelProvider(problem);
    final problemUpdateViewState = ref.watch(provider);
    final problemUpdateViewModel = ref.read(provider.notifier);
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;

    final solutionController = useTextEditingController();

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
                color: Color(0xffffffff),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// 시트 헤더 영역
                  ///
                  /// 제목과 닫기 버튼
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Opacity(
                        opacity: 0,
                        child: Icon(Icons.close),
                      ),
                      const Text(
                        "완료하기",
                        style: TextStyle(
                            color: Color(0xff303030),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: const Icon(Icons.close))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// 제목 입력 칸
                  CustomTextField(
                    hintText: problem.title,
                    enabled: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  /// 사용자의 기록 상세 내용 칸
                  CustomTextField(
                    hintText: problem.content,
                    maxLines: 3,
                    enabled: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        "나의 해결 방법",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextField(
                      controller: solutionController,
                      onChanged: (solution) {
                        problemUpdateViewModel.onEvent(
                            ProblemUpdateViewEvent.solutionChanged(
                                solution: solution));
                      },
                      maxLines: 3,
                      hintText: "어떻게 해결했나요?",
                      hintStyle: const TextStyle(
                        color: Color(0xffacacac),
                        fontFamily: "Roboto",
                        fontSize: 15,
                      )),

                  const SizedBox(
                    height: 70,
                  ),

                  /// 해결 방법 등록 버튼
                  ///
                  ///
                  /// 해결 방법이 없어도 등록 가능
                  GestureDetector(
                      onTap: () async {
                        onCompleteTap(problemUpdateViewState.problem);
                        Navigator.of(context).pop();
                      },

                      /// 버튼은 빈칸인 경우에는 비활성화되어있음.
                      child: Container(
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 11.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: problemUpdateViewState.validateTitle
                                ? const Color(0xff000025).withOpacity(.9)
                                : const Color(0xffacacac)),
                        child: const Text(
                          "완료하기",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Color(0xffffffff),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
