import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_event.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_view_model.dart';
import 'package:solution_diary_app/src/core/widgets/image_icon.dart';
import 'package:solution_diary_app/src/feature/auth/ui/widgets/social_login_button.dart';

class GoogleLoginButtonView extends ConsumerWidget {
  const GoogleLoginButtonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginUiViewModelProvider.notifier);
    return SocialLoginButton(
      onTap: () async {
        viewModel.onEvent(GoogleLoginButtonTap());
      },
      icon: IconImage(path: ImagePath.google),
      backgroundColor: const Color(0xffF2F2F2),
      label: const Text(
        "Google로 로그인",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto-Medium",
            color: Color(0xff1f1f1f)),
      ),
    );
  }
}
