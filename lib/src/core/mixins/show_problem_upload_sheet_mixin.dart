import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/ui/view/problem_upload_sheet.dart';

mixin ShowProblemUploadSheetMixin {
  void showProblemAddSheet(BuildContext context) {
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
        builder: (context) => const ProblemUploadSheet());
  }
}
