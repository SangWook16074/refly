import 'package:flutter/material.dart';

class SectorWidget extends Container {
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  SectorWidget({
    super.key,
    super.padding,
    this.backgroundColor,
    this.borderRadius,
    super.child,
  }) : super(
          decoration:
              BoxDecoration(color: backgroundColor, borderRadius: borderRadius),
        );
}
