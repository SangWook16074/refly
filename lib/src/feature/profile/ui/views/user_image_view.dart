import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/user_view_model.dart';
import 'package:solution_diary_app/src/feature/profile/ui/widgets/user_image.dart';

class UserImageView extends ConsumerWidget {
  const UserImageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.watch(
        userViewModelProvider.select((it) => it?.userMetadata?["avatar_url"]));

    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child:
          url != null ? UserImage(url: url) : const Icon(Icons.account_circle),
    );
  }
}
