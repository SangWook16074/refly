import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/mixins/show_problem_upload_sheet_mixin.dart';
import 'package:solution_diary_app/src/ui/problem/view/date_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/expand_date_widget_view.dart';
import 'package:solution_diary_app/src/ui/problem/view/problem_upload_fab.dart';
import 'package:solution_diary_app/src/ui/solution_history_ui.dart';
import 'package:solution_diary_app/src/ui/problem/view/user_state_view.dart';
import 'package:solution_diary_app/src/ui/problem/viewModel/date_view_model.dart';
import 'package:solution_diary_app/src/ui/unresolved_history_ui.dart';

extension on DateTime {
  String toTabText() {
    final now = DateTime.now();
    return (year == now.year && month == now.month && day == now.day)
        ? "오늘"
        : "$month/$day";
  }
}

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
  final maxSheetSize = 0.85;
  var expandDateViewTransProgress = 0.0;

  final minSheetSize = 0.4;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  _calculateDateWidgetOpacity(double extent) {
    final height = MediaQuery.of(context).size.height;
    final initSheet = height * maxSheetSize;
    final realStart = ((initSheet - 32) / height).clamp(0.0, 1.0);

    final start = realStart;
    const end = 0.7;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    _dateWidgetOpacity = result;
  }

  _calculateUserStateOpacity(double extent) {
    const start = 0.7;
    const end = 0.4;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    final result = ((start - extent) / (start - end)).clamp(0.0, 1.0);

    _userStateOpacity = result;
  }

  _calculateYPosition(double extent) {
    final height = MediaQuery.of(context).size.height;
    final initSheet = height * maxSheetSize;
    final realStart = ((initSheet - 32) / height).clamp(0.0, 1.0);
    final start = maxSheetSize;
    final end = minSheetSize;

    // clamp 시켜서 0 ~ 1 사이로 보간값 만들기
    expandDateViewTransProgress =
        ((realStart - extent) / (realStart - end)).clamp(0.0, 1.0);
    snapProgress = ((start - extent) / (start - end)).clamp(0.0, 1.0);
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
    final size = mediaQuery.size;
    final maxHeight = size.height - MediaQuery.of(context).padding.top;
    final theme = Theme.of(context);
    final dateWidgetHeight = size.height * (maxSheetSize - 0.4);

    return Scaffold(
      floatingActionButton: const ProblemUploadFABView(),
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        // fit: StackFit.passthrough,
        // alignment: AlignmentDirectional.topCenter,z
        children: [
          Container(
            height: maxHeight * 0.8,
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
            child: Opacity(
              opacity: _userStateOpacity,
              child: Transform.translate(
                offset: Offset(
                    0, -maxHeight * 0.35 + dateWidgetHeight * snapProgress),
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeight * 0.3),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: UserStateView(height: maxHeight * 0.3),
                    )),
              ),
            ),
          ),
          SafeArea(
              child: Opacity(
            opacity: _dateWidgetOpacity < 1 ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 8.0 + dateWidgetHeight * snapProgress,
                  left: 16.0,
                  right: 16.0),
              child:
                  const Align(alignment: Alignment.topRight, child: DateView()),
            ),
          )),
          SafeArea(
            child: IgnorePointer(
              ignoring: _dateWidgetOpacity < 1,
              child: Opacity(
                opacity: _dateWidgetOpacity,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: (dateWidgetHeight - 32) *
                          expandDateViewTransProgress),
                  child: SizedBox(
                      height: 40 + ((size.width - 16 * 6) / 6),
                      child: const ExpandDateWidgetView()),
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
                expand: true,
                snap: true,
                controller: _controller,
                snapSizes: const [.7],
                builder: (context, scrollController) {
                  return LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight,
                          minHeight: constraints.minHeight,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16.0)),
                              color: theme.scaffoldBackgroundColor),
                          child: DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: TabBar(
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
                                        tabs: [
                                          Consumer(
                                            builder: (context, ref, child) =>
                                                Tab(
                                              text:
                                                  "${ref.watch(dateViewModelProvider).toTabText()} 기록",
                                            ),
                                          ),
                                          const Tab(
                                            text: "미해결 문제",
                                          ),
                                        ]),
                                  ),
                                  const Expanded(
                                    child: TabBarView(
                                        physics: ClampingScrollPhysics(),
                                        children: [
                                          SolutionHistoryUI(),
                                          UnresolvedHistoryUI(),
                                        ]),
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
