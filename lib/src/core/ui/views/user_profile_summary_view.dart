import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_image_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_login_provider_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_name_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_view.dart';

class UserProfileSummaryView extends StatelessWidget {
  const UserProfileSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 130),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: const Color(0xfff3f3f3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50, child: UserImageView()),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserNameView(),
                    SizedBox(
                      height: 5,
                    ),
                    UserLoginProviderView()
                  ],
                ),
              )
            ],
          ),
          UserStatView()
        ],
      ),
    );
  }
}
