import 'package:flutter/material.dart';

class SheetItemRow extends StatelessWidget {
  final Widget? child;
  final void Function()? onTap;
  const SheetItemRow({super.key, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Center(child: child),
      ),
    );
  }
}
