import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditSheetWidget extends ConsumerWidget {
  final String editLabel;
  final void Function()? onEdit;
  final String cancelLabel;
  final void Function()? onDelete;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const EditSheetWidget({
    super.key,
    required this.editLabel,
    required this.cancelLabel,
    this.backgroundColor,
    this.onEdit,
    this.onDelete,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xffffffff),
          border: Border.all(width: 0.5, color: const Color(0xffdfdfdf)),
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onEdit,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    editLabel,
                    style: const TextStyle(
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
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    cancelLabel,
                    // selectionColor: Color(0xffff0000),
                    style: const TextStyle(
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
