import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:solution_diary_app/src/feature/auth/ui/views/apple_login_button_view.dart';
import 'package:solution_diary_app/src/feature/auth/ui/views/google_login_button_view.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GoogleLoginButtonView(),
        if (Platform.isIOS) ...[
          const SizedBox(
            height: 20,
          ),
          const AppleLoginButtonView(),
        ]
      ],
    );
  }
}
