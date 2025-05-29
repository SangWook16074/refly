import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/profile/ui/views/user_image_view.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final length = (width - 120) / 2;

    return Stack(
      children: [
        Container(height: 300, color: theme.colorScheme.primary),
        Positioned(
          top: 150,
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16.0))),
          ),
        ),
        Positioned(
            top: 90,
            bottom: 90,
            right: length,
            left: length,
            child: const UserImageView())
      ],
    );
  }
}
