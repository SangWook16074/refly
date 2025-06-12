import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/user/ui/viewModels/user_view_model.dart';

class UserNameView extends ConsumerWidget {
  const UserNameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final name = ref.watch(userViewModelProvider
        .selectAsync((it) => it.userMetadata?["name"] as String));
    return FutureBuilder<String>(
        future: name,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data ?? "-",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.secondary),
            );
          } else {
            return Text(
              "-",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.secondary),
            );
          }
        });
  }
}
