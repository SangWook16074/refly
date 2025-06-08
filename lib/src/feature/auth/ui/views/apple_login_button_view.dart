import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_view_model.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/auth/ui/widgets/social_login_button.dart';

class AppleLoginButtonView extends ConsumerWidget {
  const AppleLoginButtonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginUiViewModelProvider.notifier);
    return SocialLoginButton(
      backgroundColor: const Color(0xff000000),
      // icon: ImageIcon(path: ImagePath.google),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child:
            SizedBox(width: 24, child: IconImageWidget(path: ImagePath.apple)),
      ),
      onTap: () {
        viewModel.appleLogin();
      },
      label: const Text(
        "Apple로 로그인",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
