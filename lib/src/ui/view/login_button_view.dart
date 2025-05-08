import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:solution_diary_app/src/ui/view/apple_login_button_view.dart';
import 'package:solution_diary_app/src/ui/view/google_login_button_view.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const GoogleLoginButtonView();
    } else {
      return const AppleLoginButtonView();
    }
  }
}
