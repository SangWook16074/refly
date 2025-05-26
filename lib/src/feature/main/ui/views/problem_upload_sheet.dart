import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/data/models/problem_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/problem_view_event.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/date_view_model.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/daily_problem_view_model.dart';
import 'package:solution_diary_app/src/core/widgets/custom_text_field.dart';

/// 사용자가 새롭게 생성할 기록의 제목이 빈칸인지 나타내는 Enum 클래스
///
/// 사용자는 valid 상태인 경우에만 새로운 기록을 등록할 수 있습니다.
enum TitleValidateState { init, invalid, valid }

class ProblemUploadSheet extends HookConsumerWidget {
  const ProblemUploadSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    final isTitleValidate =
        useState<TitleValidateState>(TitleValidateState.init);
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;
    final dateState = ref.watch(dateViewModelProvider);
    final viewModel =
        ref.read(DailyProblemViewModelProvider(target: dateState).notifier);

    bool validateTitle(String title) {
      // 공백제거시 빈칸인 경우는 잘못된 경우
      if (title.trim().isEmpty) {
        return false;
      }

      // 그 외에는 모두 올바른 경우
      return true;
    }

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
                      "새 문제 추가하기",
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
                    isTitleValidate.value = validateTitle(title)
                        ? TitleValidateState.valid
                        : TitleValidateState.invalid;
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
                        isTitleValidate.value != TitleValidateState.invalid
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
                ),
                const SizedBox(
                  height: 70,
                ),

                /// 새로운 기록 저장 버튼
                ///
                ///
                /// 제목이 비어있는 경우가 아니라면 새로운 기록 등록 가능
                GestureDetector(
                    onTap: () {
                      if (isTitleValidate.value == TitleValidateState.valid) {
                        viewModel.onEvent(CreateProblem(
                            problem: ProblemModel(
                                id: null,
                                title: titleController.text,
                                content: contentController.text,
                                isDone: false,
                                createAt: DateTime.now())));
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
                          color:
                              isTitleValidate.value == TitleValidateState.valid
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
