import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/data/problem/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/ui/problem/model/problem_view_event.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';
import 'package:solution_diary_app/src/ui/widgets/custom_text_field.dart';

class ProblemUploadSheet extends HookConsumerWidget {
  const ProblemUploadSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    final isTitleValidate = useState<bool>(true);
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;
    final viewModel = ref.read(problemViewModelProvider.notifier);

    bool validateTitle(String title) {
      if (title.trim().isEmpty) {
        return false;
      }
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
                CustomTextField(
                  controller: titleController,
                  hintText: "제목(필수)",
                  onChanged: (title) {
                    isTitleValidate.value = validateTitle(title);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Text(
                        isTitleValidate.value ? "" : "제목을 입력해주세요!",
                        style: const TextStyle(
                            color: Color(0xffff0000),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: contentController,
                  hintText: "상세 내용(선택)",
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                    onTap: () {
                      if (isTitleValidate.value) {
                        viewModel.onEvent(CreateProblem(
                            problem: ProblemRequestDto(
                                title: titleController.text,
                                content: contentController.text,
                                isDone: false,
                                createAt: DateTime.now())));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isTitleValidate.value
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
