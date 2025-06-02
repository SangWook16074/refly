import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_resolution_rate_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_view.dart';

class UserStateUI extends StatelessWidget {
  const UserStateUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: UserStatView()),
        SizedBox(
          width: 18.0,
        ),
        Expanded(child: UserResolutionRateView()),
      ],
    );
  }
}
