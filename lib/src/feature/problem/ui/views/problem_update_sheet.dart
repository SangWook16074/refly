import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_text_field.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_update_view_event.dart';
import 'package:solution_diary_app/src/feature/problem/ui/viewModels/problem_update_view_model.dart';

class ProblemUpdateSheet extends HookConsumerWidget {
  final ProblemModel problem;
  final void Function(ProblemModel) onUpdateTap;
  const ProblemUpdateSheet(
      {super.key, required this.problem, required this.onUpdateTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = problemUpdateViewModelProvider(problem);
    final problemUpdateViewState = ref.watch(provider);
    final problemUpdateViewModel = ref.read(provider.notifier);
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;

    final titleController = useTextEditingController();
    final contentController = useTextEditingController();

    useEffect(() {
      titleController.text = problemUpdateViewState.problem.title;
      contentController.text = problemUpdateViewState.problem.content;
      return null;
    }, [titleController, contentController]);

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
                      "수정하기",
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
                  controller: titleController,
                  hintText: "제목(필수)",
                  onChanged: (title) {
                    problemUpdateViewModel.onEvent(
                        ProblemUpdateViewEvent.titleChanged(title: title));
                  },
                ),

                /// 제목이 올바른 형식인지 알려주는 validation 메시지 텍스트
                ///
                /// 제목이 빈칸이어서 올바르지 않은 경우에만 보임
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Text(
                        problemUpdateViewState.validateTitle
                            ? ""
                            : "제목을 입력해주세요!",
                        style: const TextStyle(
                            color: Color(0xffff0000),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                /// 사용자의 기록 상세 내용 칸
                CustomTextField(
                  controller: contentController,
                  hintText: "상세 내용(선택)",
                  maxLines: 3,
                  onChanged: (content) {
                    problemUpdateViewModel.onEvent(
                        ProblemUpdateViewEvent.contentChanged(
                            content: content));
                  },
                ),
                const SizedBox(
                  height: 70,
                ),

                /// 새로운 기록 저장 버튼
                ///
                ///
                /// 제목이 비어있는 경우가 아니라면 새로운 기록 등록 가능
                GestureDetector(
                    onTap: () async {
                      if (problemUpdateViewState.validateTitle) {
                        onUpdateTap(problemUpdateViewState.problem);
                        Navigator.of(context).pop();
                      }
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
                        "등록하기",
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
    );
  }
}
