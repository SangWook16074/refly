import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_view.dart';
import 'package:solution_diary_app/src/ui/widgets/date_widget.dart';

class MainUI extends StatelessWidget {
  const MainUI({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height * 0.7,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  focal: Alignment.bottomRight,
                  radius: 1,
                  colors: [
                theme.colorScheme.secondary,
                theme.colorScheme.primary,
              ])),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "해결 일기",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  DateWidget(date: DateTime.now())
                ],
              ),
            ),
          ),
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.8,
            minChildSize: 0.4,
            snap: true,
            snapSizes: const [.7],
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Container(
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16.0)),
                      color: theme.scaffoldBackgroundColor),
                  child: DefaultTabController(
                      length: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            TabBar(
                                unselectedLabelStyle: TextStyle(
                                  color:
                                      const Color(0xff000000).withOpacity(0.6),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                labelStyle: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                tabs: const [
                                  Tab(
                                    text: "오늘 기록",
                                  ),
                                  Tab(
                                    text: "미해결 문제",
                                  ),
                                ]),
                            Expanded(
                              child: TabBarView(children: [
                                const ProblemView(),
                                Container(
                                  height: 20,
                                ),
                              ]),
                            )
                          ],
                        ),
                      )),
                ),
              );
            })
      ],
    ));
  }
}
