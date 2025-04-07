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
  var _opacity = 0.0;
  var snapProgress = 0.0;
  final maxSheetSize = 0.83;

  final minSheetSize = 0.5;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  _calculateOpacity(double extent) {
    final start = maxSheetSize;
    const end = 0.7;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    _opacity = result;
  }

  _calculateYPosition(double extent) {
    final start = maxSheetSize;
    final end = minSheetSize;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    snapProgress = result;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentExtent = _controller.size;
        _calculateOpacity(_currentExtent);
        _calculateYPosition(_currentExtent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final sheetHeight = size.height * maxSheetSize;
    final dateWidgetHeight = size.height * (maxSheetSize - 0.5);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        // alignment: AlignmentDirectional.topCenter,z
        children: [
          Container(
            height: size.height * 0.7,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 1,
                    colors: [
                  theme.colorScheme.secondary,
                  theme.colorScheme.primary,
                ])),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50,
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
          ),
          SafeArea(
              child: Opacity(
            opacity: _opacity < 1 ? 1 : 0,
            child: Transform.translate(
              offset: Offset(0, dateWidgetHeight * snapProgress),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: DateWidget(date: DateTime.now())),
              ),
            ),
          )),
          SafeArea(
            child: IgnorePointer(
              ignoring: _opacity < 1,
              child: Opacity(
                opacity: _opacity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0 + dateWidgetHeight * snapProgress,
                      horizontal: 8.0),
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 50),
                      child: ExpandDateWidget(now: DateTime.now())),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: DraggableScrollableSheet(
                initialChildSize: maxSheetSize,
                maxChildSize: maxSheetSize,
                minChildSize: minSheetSize,
                snap: true,
                controller: _controller,
                snapSizes: const [.7],
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      height: sheetHeight,
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
                }),
          )
        ],
      ),
    );
  }
}
