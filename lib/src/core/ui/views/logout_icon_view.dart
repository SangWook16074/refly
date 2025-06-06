import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_event.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_view_model.dart';
import 'package:solution_diary_app/src/core/ui/widgets/custom_dialog.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';

class LogoutIconView extends ConsumerWidget {
  const LogoutIconView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainUiViewModel = ref.read(mainUiViewModelProvider.notifier);

    showLogoutDialog() {
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

    return GestureDetector(
        onTap: showLogoutDialog,
        child: SizedBox(
            width: 20, child: IconImageWidget(path: ImagePath.logout)));
  }
}
