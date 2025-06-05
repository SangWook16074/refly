import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/solved_history_ui.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/unresolved_history_ui.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_resolution_rate_progress_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_resolution_rate_view.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_view.dart';

class UserProblemDetailSheet extends StatelessWidget {
  const UserProblemDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return DefaultTabController(
      length: 3,
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: FocusScope.of(context).unfocus,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                height: size.height * 0.8,
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Opacity(
                            opacity: 0,
                            child: Icon(Icons.close),
                          ),
                          const Text(
                            "전체 해결 기록",
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          GestureDetector(
                              onTap: Navigator.of(context).pop,
                              child: const Icon(Icons.close))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: NestedScrollView(
                          physics: const ClampingScrollPhysics(),
                          headerSliverBuilder: (context, innerBoxIsScrolled) =>
                              [
                                SliverList(
                                    delegate: SliverChildListDelegate([
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                    child: const Column(
                                      children: [
                                        UserStatView.large(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "문제 해결률",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff191F40),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            UserResolutionRateView(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        UserResolutionRateProgressView(),
                                      ],
                                    ),
                                  ),
                                ]))
                              ],
                          body: Column(
                            children: [
                              const TabBar(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  labelPadding: EdgeInsets.zero,
                                  labelColor: Color(0xff191F40),
                                  unselectedLabelColor: Color(0xff676767),
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "해결 중",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "해결 완료",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "즐겨찾기",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ]),
                              Expanded(
                                child: TabBarView(
                                    physics: const ClampingScrollPhysics(),
                                    children: [
                                      const UnresolvedHistoryUI(),
                                      const SolvedHistoryUI(),
                                      Container(),
                                    ]),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ))),
    );
  }
}
