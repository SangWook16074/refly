import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_view.dart';
import 'package:solution_diary_app/src/ui/widgets/date_widget.dart';
import 'package:solution_diary_app/src/ui/widgets/expand_date_widget.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  var _currentExtent = 1.0;
  var progress = 0.0;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  _calculateOpacity(double extent) {
    const start = 1.0;
    const end = 0.9;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    progress = result;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentExtent = _controller.size;
        _calculateOpacity(_currentExtent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  radius: 1,
                  colors: [
                theme.colorScheme.secondary,
                theme.colorScheme.primary,
              ])),
          child: Column(
            children: [
              Stack(
                children: [
                  const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "해결 일기",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Transform.translate(
                      offset: Offset(0, 110 * progress),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: DateWidget(date: DateTime.now())),
                    ),
                  )),
                  SafeArea(
                    child: IgnorePointer(
                      ignoring: progress == 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: progress,
                        child: Transform.translate(
                          offset: Offset(0, 110 * progress),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 8.0),
                            child: SizedBox(
                              height: 50,
                              child: ExpandDateWidget(now: DateTime.now()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return DraggableScrollableSheet(
                      initialChildSize: 1.0,
                      maxChildSize: 1.0,
                      minChildSize: 0.5,
                      expand: false,
                      snap: true,
                      controller: _controller,
                      snapSizes: const [.9],
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          physics: const ClampingScrollPhysics(),
                          child: Container(
                            height: constraints.maxHeight,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16.0)),
                                color: theme.scaffoldBackgroundColor),
                            child: DefaultTabController(
                                length: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    children: [
                                      TabBar(
                                          unselectedLabelStyle: TextStyle(
                                            color: const Color(0xff000000)
                                                .withOpacity(0.6),
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
                      });
                }),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
