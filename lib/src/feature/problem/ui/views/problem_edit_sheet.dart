import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProblemEditSheet extends ConsumerWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;
  const ProblemEditSheet({
    super.key,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final now = ref.watch(dateViewModelProvider);
    // final problemListViewState = ref.watch(problemListViewModelProvider);
    // final problemListViewModel =
    //     ref.read(problemListViewModelProvider.notifier);
    // final problemViewModel =
    //     ref.read(DailyProblemViewModelProvider(target: now).notifier);
    // final userStatViewModel = ref.read(userStatViewModelProvider.notifier);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          border: Border.all(width: 0.5, color: const Color(0xffdfdfdf)),
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onEdit,
            child: const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "수정하기",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Color(0xffdfdfdf),
          ),
          GestureDetector(
            onTap: onDelete,
            child: const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "삭제하기",
                    // selectionColor: Color(0xffff0000),
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffff0000)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
