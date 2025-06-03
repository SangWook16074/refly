import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_view_model.dart';

class UserLoginProviderView extends ConsumerWidget {
  const UserLoginProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(userViewModelProvider
        .selectAsync((it) => it.appMetadata["provider"] as String));
    return Row(
      children: [
        FutureBuilder(
            future: authProvider,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return Container();
              }

              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 15,
                    child: IconImageWidget(
                      path: switch (snapshot.data) {
                        "google" => ImagePath.google,
                        _ => ImagePath.appleBlack
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    "로 로그인함",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff575757)),
                  )
                ],
              );
            })
      ],
    );
  }
}
