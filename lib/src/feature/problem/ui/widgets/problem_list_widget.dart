import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';
import 'package:solution_diary_app/src/core/ui/widgets/edit_sheet_widget.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/problem_list_row.dart';
import 'package:solution_diary_app/src/feature/problem/ui/widgets/problem_preview_widget.dart';
import 'package:solution_diary_app/src/feature/problem/ui/widgets/problem_status_widget.dart';

class ProblemListWidget extends HookWidget {
  final List<ProblemModel> problems;
  final void Function(ProblemModel) onItemEdit;
  final void Function(int) onItemDelete;
  final void Function(ProblemModel) onItemTrailing;
  final void Function(ProblemModel) onItemPrefix;
  final ScrollPhysics physics;
  const ProblemListWidget(
      {super.key,
      required this.problems,
      required this.onItemEdit,
      required this.onItemDelete,
      required this.onItemTrailing,
      required this.onItemPrefix,
      this.physics = const ClampingScrollPhysics()});

  @override
  Widget build(BuildContext context) {
    final preview = useState<OverlayEntry?>(null);

    OverlayEntry buildProblemPreview(ProblemModel problem) {
      final id = problem.id;
      final title = problem.title;
      final content = problem.content;
      final solution = problem.solution;

      final isDone = problem.isDone;
      return OverlayEntry(
          builder: (context) => Material(
                color: const Color(0xff000000).withAlpha((255 * 0.1).round()),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 100),
                    child: Dismissible(
                      key: ValueKey(id),
                      onDismissed: (direction) {
                        preview.value?.remove();
                      },
                      direction: DismissDirection.down,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProblemPreviewWidget(
                              title: title,
                              content: content,
                              solution: solution,
                              isDone: isDone,
                              trailing: ProblemStatusWidget(isDone: isDone),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            EditSheetWidget(
                              editLabel: "수정하기",
                              onEdit: () {
                                if (id == null) return;
                                preview.value?.remove();
                                onItemEdit(problem);
                              },
                              cancelLabel: "삭제하기",
                              onDelete: () {
                                preview.value?.remove();
                                onItemDelete(id!);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
    }

    return ListView.separated(
        physics: physics,
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 150),
        separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
        itemCount: problems.length,
        itemBuilder: (context, index) {
          final problem = problems[index];
          final title = problem.title;
          final isDone = problem.isDone;
          final isFavorite = problem.isFavorite;
          return GestureDetector(
              onLongPress: () {
                preview.value = buildProblemPreview(problem);
                Overlay.of(context).insert(preview.value!);
              },
              child: ProblemListRow(
                title: title,
                isFavorite: isFavorite,
                trailing: ProblemStatusWidget(isDone: isDone),
                onTrailing: () => onItemTrailing(problem),
                onPrefix: () => onItemPrefix(problem),
              ));
        });
  }
}
