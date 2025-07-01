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
          _EditSheetButtonItem(onTap: onEdit, label: "수정하기"),
          const Divider(
            thickness: 0.5,
            color: Color(0xffdfdfdf),
          ),
          _EditSheetButtonItem(onTap: onDelete, label: "삭제하기")
        ],
      ),
    );
  }
}

class _EditSheetButtonItem extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const _EditSheetButtonItem({super.key, this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xffff0000)),
          ),
        ),
      ),
    );
  }
}
