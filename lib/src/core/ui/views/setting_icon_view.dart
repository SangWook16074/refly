import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/core/ui/views/setting_sheet.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';

class SettingIconView extends StatelessWidget {
  const SettingIconView({super.key});

  @override
  Widget build(BuildContext context) {
    showSettingBottomSheet() {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          context: context,
          elevation: 0.0,
          useSafeArea: true,
          enableDrag: true,
          backgroundColor: Colors.transparent,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => const SettingSheet());
    }

    return GestureDetector(
      onTap: showSettingBottomSheet,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: 24,
          child: IconImageWidget(
            path: ImagePath.setting,
          ),
        ),
      ),
    );
  }
}
