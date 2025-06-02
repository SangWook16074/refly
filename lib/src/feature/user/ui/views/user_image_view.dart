import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/user_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserImageView extends StatelessWidget {
  final User user;
  const UserImageView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final url = user.userMetadata?["avatar_url"];
    return Container(
      width: 110,
      height: 110,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4.0,
                offset: const Offset(0, 4),
                color:
                    const Color(0xff000000).withAlpha((255.0 * 0.04).round()))
          ],
          color: const Color(0xffefefef),
          border: Border.all(width: 0.5, color: const Color(0xffefefef)),
          borderRadius: BorderRadius.circular(100.0)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: url != null
              ? UserImage(url: url)
              : IconImageWidget(path: ImagePath.basicUserImage)),
    );
  }
}
