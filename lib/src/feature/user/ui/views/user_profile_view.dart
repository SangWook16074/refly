import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_view_model.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_image_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final length = (width - 120) / 2;
    final userViewState = ref.watch(userViewModelProvider);
    return userViewState.when(loaded: (User user) {
      return Stack(
        children: [
          Container(height: 200, color: theme.colorScheme.primary),
          Positioned(
            top: 100,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16.0))),
            ),
          ),
          Positioned(
              top: 40,
              bottom: 40,
              right: length,
              left: length,
              child: UserImageView(user: user))
        ],
      );
    }, error: (String message) {
      return Text(message);
    });
  }
}
