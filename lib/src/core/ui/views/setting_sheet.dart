import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_event.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_view_model.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/core/ui/widgets/sheet_item_row.dart';

class SettingSheet extends ConsumerWidget {
  const SettingSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainUiViewModel = ref.read(mainUiViewModelProvider.notifier);
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;

    showLogoutDialog() {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "정말로 로그아웃 할까요?",
                onConfirm: () {
                  Navigator.of(context).pop();
                  mainUiViewModel
                      .onEvent(const MainUiEvent.userLogoutButtonTaped());
                },
              ));
    }

    showDeleteUserDialog() {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => CustomDialog(
                content: "정말로 회원탈퇴 할까요?\n그동안 작성한 모든 기록은 즉시 삭제되며 복구할 수 없습니다.",
                onConfirm: () {
                  Navigator.of(context).pop();
                  mainUiViewModel
                      .onEvent(const MainUiEvent.userDeleteUserButtonTaped());
                },
              ));
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SheetItemRow(
                  onTap: showLogoutDialog,
                  child: const Text(
                    "로그아웃",
                    style: TextStyle(
                        color: Color(0xffFF4E4E),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  color: Color(0xffdbdbdb),
                ),
                SheetItemRow(
                  onTap: showDeleteUserDialog,
                  child: const Text(
                    "회원탈퇴",
                    style: TextStyle(
                        color: Color(0xffFF4E4E),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
