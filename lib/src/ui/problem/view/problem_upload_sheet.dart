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
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;
    final viewModel = ref.read(problemViewModelProvider.notifier);
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
                CustomTextField(controller: titleController, hintText: "제목"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: contentController,
                  hintText: "상세 내용",
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                    onTap: () {
                      viewModel.onEvent(CreateProblem(
                          problem: ProblemRequestDto(
                              title: titleController.text,
                              content: contentController.text,
                              isDone: false,
                              createAt: DateTime.now())));
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff000025).withOpacity(.9)),
                      child: const Text(
                        "등록하기",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Color(0xffffffff),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
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
