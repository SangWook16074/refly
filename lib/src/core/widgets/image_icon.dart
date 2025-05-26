import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  final String path;

  const IconImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      child: Image.asset(path),
    );
  }
}

final class ImagePath {
  static String get google => "assets/images/google_ic.png";
  static String get apple => "assets/images/apple_ic.png";
}
