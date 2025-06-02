import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/widgets/user_image.dart';

class UserImageView extends ConsumerWidget {
  const UserImageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.watch(userViewModelProvider
        .selectAsync((it) => it.userMetadata?["avatar_url"] as String));

    return Container(
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
            child: FutureBuilder<String>(
                future: url,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return UserImage(url: snapshot.data!);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconImageWidget(path: ImagePath.basicUserImage),
                    );
                  }
                })));
  }
}
