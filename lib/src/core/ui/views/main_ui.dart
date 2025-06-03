import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/date_view.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/expand_date_widget_view.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/solution_history_by_daily_ui.dart';
import 'package:solution_diary_app/src/feature/user/ui/views/user_state_ui.dart';
import 'package:solution_diary_app/src/core/ui/widgets/drag_handle.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> with ShowProblemUploadSheetMixin {
  var _currentExtent = 1.0;
  var _dateWidgetOpacity = 1.0;
  var _userStateOpacity = 0.0;
  var snapProgress = 0.375;
  var expandDateViewTransProgress = 0.0;
  final maxSheetSize = 1.0;
  final snapSheetSize = 0.85;
  final minSheetSize = 0.6;

  late final DraggableScrollableController _controller;

  _calculateDateWidgetOpacity(double extent) {
    setState(() {
      final opacity = (1 - extent) * 20 / 3;
      if (opacity > 1.0) {
        _dateWidgetOpacity = 1.0;
      } else {
        _dateWidgetOpacity = opacity;
      }
    });
  }

  _calculateUserStateOpacity(double extent) {
    final start = snapSheetSize;
    final end = minSheetSize;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    _userStateOpacity = result;
  }

  _calculateYPosition(double extent) {
    setState(() {
      snapProgress = (1 - extent) * 100 / 40;
      log(snapProgress.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    // snapProgress = (1 - _controller.size) * 100 / 40;
    _controller = DraggableScrollableController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        snapProgress = (1 - _controller.size) * 100 / 40;
        _controller.addListener(() {
          _currentExtent = _controller.size;
          log(_currentExtent.toString());
          _calculateDateWidgetOpacity(_currentExtent);
          _calculateUserStateOpacity(_currentExtent);
          _calculateYPosition(_currentExtent);
        });
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
    final totalTopWidgetHeight =
        (maxHeight - 2 * appBarSize - paddingTop) * 0.4;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: SizedBox(
          width: 30,
          child: IconImageWidget(
            path: ImagePath.logo,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          /// 배경 색상
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

          /// 메인 UI의 사용자 상태 및 날짜 캘린더 뷰
          Positioned(
            top: appBarSize + (snapProgress - 1) * totalTopWidgetHeight,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SizedBox(
                height: totalTopWidgetHeight,
                child: Column(
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
                          Opacity(
                            opacity: _dateWidgetOpacity > 0.99999 ? 0 : 1,
                            child: const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 40, right: 16.0),
                                  child: DateView(),
                                )),
                          ),
                          IgnorePointer(
                            ignoring: _dateWidgetOpacity == 0,
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

          /// 메인 UI의 전체 시트 뷰
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
                      children: [
                        Text(
                          "해결 일기",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //   child: IconImageWidget(path: ImagePath.arrowDown),
                        // )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: DraggableScrollableSheet(
                      initialChildSize: snapSheetSize,
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
                                child: Container(
                                  height: constraints.maxHeight,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
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
