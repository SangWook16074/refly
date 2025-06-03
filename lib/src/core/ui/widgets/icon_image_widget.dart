import 'package:flutter/material.dart';

class IconImageWidget extends StatelessWidget {
  final String path;

  const IconImageWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.contain,
    );
  }
}

final class ImagePath {
  static String get google => "assets/images/google_ic.png";
  static String get apple => "assets/images/apple_ic.png";
  static String get appleBlack => "assets/images/apple_ic_black.png";
  static String get basicUserImage => "assets/images/basic_user.png";
  static String get arrowDown => "assets/images/arrow_down_ic.png";
  static String get logo => "assets/images/logo_ic.png";
  static String get logout => "assets/images/logout_ic.png";
}
