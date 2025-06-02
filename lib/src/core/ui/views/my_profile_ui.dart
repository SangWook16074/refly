import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/solved_history_ui.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/unresolved_history_ui.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/user_problem_list_tab_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_profile_view.dart';

class UserProfileUI extends StatelessWidget {
  const UserProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
            body: const Column(
              children: [
                UserProblemListTabView(),
                Expanded(
                    child: TabBarView(children: [
                  UnresolvedHistoryUI(),
                  SolvedHistoryUI(),
                ]))
              ],
            )),
      ),
    );
  }
}
