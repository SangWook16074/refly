import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/profile/ui/views/user_image_view.dart';
import 'package:solution_diary_app/src/feature/profile/ui/views/user_profile_view.dart';
import 'package:solution_diary_app/src/feature/profile/ui/widgets/user_image.dart';

class UserUI extends StatelessWidget {
  const UserUI({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            "내 프로필",
          ),
          titleTextStyle:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverList(
                    delegate:
                        SliverChildListDelegate([const UserProfileView()]))
              ];
            },
            body: Column(
              children: [
                TabBar(
                    indicatorColor: theme.colorScheme.primary,
                    labelStyle: const TextStyle(color: Color(0xff000000)),
                    unselectedLabelStyle: TextStyle(
                        color: const Color(0xff000000)
                            .withAlpha((255.0 * 0.6).round())),
                    tabs: const [
                      Tab(
                        text: "진행중",
                      ),
                      Tab(
                        text: "해결완료",
                      ),
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemCount: 50,
                      itemBuilder: (context, index) => Container(
                            color: Colors.blue,
                          )),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemCount: 50,
                      itemBuilder: (context, index) => Container(
                            color: Colors.green,
                          )),
                ]))
              ],
            )),
      ),
    );
  }
}
