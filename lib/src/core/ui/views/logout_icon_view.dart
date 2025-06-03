import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_event.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_view_model.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';

class LogoutIconView extends ConsumerWidget {
  const LogoutIconView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainUiViewModel = ref.read(mainUiViewModelProvider.notifier);
    return GestureDetector(
        onTap: () {
          mainUiViewModel.onEvent(const MainUiEvent.userLogoutButtonTaped());
        },
        child: SizedBox(
            width: 24, child: IconImageWidget(path: ImagePath.logout)));
  }
}
