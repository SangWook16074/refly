import 'package:flutter/widgets.dart';
import 'package:solution_diary_app/src/ui/widgets/image_icon.dart';
import 'package:solution_diary_app/src/ui/widgets/social_login_button.dart';

class AppleLoginButtonView extends StatelessWidget {
  const AppleLoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      backgroundColor: const Color(0xff000000),
      // icon: ImageIcon(path: ImagePath.google),
      icon: IconImage(path: ImagePath.apple),
      onTap: () {},
      label: const Text(
        "Apple로 로그인",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xffffffff),
          fontFamily: "Roboto-Medium",
        ),
      ),
    );
  }
}
