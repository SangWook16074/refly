import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final void Function() onTap;
  final Widget label;
  final Widget icon;
  final BoxBorder? border;
  final Color backgroundColor;
  const SocialLoginButton(
      {super.key,
      required this.onTap,
      required this.label,
      required this.backgroundColor,
      required this.icon,
      this.border});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: const Color(0xff000000).withOpacity(0.05),
                  blurRadius: 4.0)
            ],
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            label,
            Opacity(
              opacity: 0.0,
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}
