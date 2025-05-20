import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';
import 'package:solution_diary_app/src/ui/view/date_view.dart';
import 'package:solution_diary_app/src/ui/view/expand_date_widget_view.dart';
import 'package:solution_diary_app/src/ui/solution_history_by_daily_ui.dart';
import 'package:solution_diary_app/src/ui/user_state_ui.dart';
import 'package:solution_diary_app/src/ui/widgets/drag_handle.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> with ShowProblemUploadSheetMixin {
  var _currentExtent = 1.0;
  var _dateWidgetOpacity = 0.0;
  var _userStateOpacity = 0.0;
  var snapProgress = 0.0;
  var expandDateViewTransProgress = 0.0;
  final maxSheetSize = 1.0;
  final snapSheetSize = 0.7;
  final minSheetSize = 0.5;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  _calculateDateWidgetOpacity(double extent) {
    final height = MediaQuery.of(context).size.height;
    final initSheet = height * maxSheetSize;
    final realStart = ((initSheet - 32) / height).clamp(0.0, 1.0);

    final start = realStart;
    final end = snapSheetSize;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    _dateWidgetOpacity = result;
  }

  _calculateUserStateOpacity(double extent) {
    final start = snapSheetSize;
    final end = minSheetSize;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    _userStateOpacity = result;
  }

  _calculateYPosition(double extent) {
    snapProgress = 2 - 2 * extent;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentExtent = _controller.size;
        // print(_currentExtent);
        _calculateDateWidgetOpacity(_currentExtent);
        _calculateUserStateOpacity(_currentExtent);
        _calculateYPosition(_currentExtent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final paddingTop = mediaQuery.padding.top;
    final theme = Theme.of(context);
    final size = mediaQuery.size;
    final maxHeight = size.height;
    final dateWidgetHeight = (size.width - 16 * 6) / 6;
    final appBarSize = dateWidgetHeight + 16;
    final totalTopWidgetHeight = (maxHeight - appBarSize - paddingTop) / 2;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: theme.colorScheme.primary.withAlpha(0),
      //   // backgroundColor: const Color(0xffffffff),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 1,
                    colors: [
                  theme.colorScheme.secondary,
                  theme.colorScheme.primary,
                ])),
          ),
          SafeArea(
            child: Transform.translate(
              /// 초기 시트값이 가장 확장되었을 때,
              /// 상단 전체 위젯은 시트의 높이의 절반만큼 위로 향해야함.
              /// 즉, 앱바를 제외한 전체 UI 높이의 절반만큼 위에 위치해야함.
              /// [totalTopWidgetHeight]
              offset: Offset(
                  0, appBarSize + (snapProgress - 1) * totalTopWidgetHeight),

              child: SizedBox(
                height: totalTopWidgetHeight,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Opacity(
                        opacity: _userStateOpacity,
                        child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: UserStateUI()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SafeArea(
                              child: Opacity(
                            opacity: _dateWidgetOpacity < 1 ? 1 : 0,
                            child: const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 40, right: 16.0),
                                  child: DateView(),
                                )),
                          )),
                          IgnorePointer(
                            ignoring: _dateWidgetOpacity < 0.98,
                            child: Opacity(
                              opacity: _dateWidgetOpacity,
                              child: const ExpandDateWidgetView(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(
                  height: appBarSize,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
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
                Expanded(
                  child: DraggableScrollableSheet(
                      initialChildSize: maxSheetSize,
                      maxChildSize: maxSheetSize,
                      minChildSize: minSheetSize,
                      expand: true,
                      snap: true,
                      controller: _controller,
                      snapSizes: const [.85],
                      builder: (context, scrollController) {
                        return LayoutBuilder(builder: (context, constraints) {
                          return Column(
                            children: [
                              SingleChildScrollView(
                                controller: scrollController,
                                physics: const ClampingScrollPhysics(),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: constraints.maxHeight,
                                    minHeight: constraints.minHeight,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(16.0)),
                                        color: theme.scaffoldBackgroundColor),
                                    child: Column(
                                      children: [
                                        DragHandle(),
                                        const Expanded(
                                            child: SolutionHistoryByDailyUI()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
