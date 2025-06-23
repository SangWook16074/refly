import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_event.dart';
import 'package:solution_diary_app/src/core/ui/viewModels/main_ui_view_model.dart';
import 'package:solution_diary_app/src/core/ui/views/logout_icon_view.dart';
import 'package:solution_diary_app/src/core/ui/views/main_ui_date_view.dart';
import 'package:solution_diary_app/src/core/ui/views/setting_icon_view.dart';
import 'package:solution_diary_app/src/core/ui/views/user_problem_detail_sheet.dart';
import 'package:solution_diary_app/src/core/ui/views/user_profile_summary_view.dart';
import 'package:solution_diary_app/src/core/ui/views/user_resolution_rate_summary_view.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/problem/ui/views/solution_history_by_daily_ui.dart';
import 'package:solution_diary_app/src/core/ui/widgets/drag_handle.dart';

class MainUI extends HookConsumerWidget {
  const MainUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainUiState = ref.watch(mainUiViewModelProvider);
    final mainUiViewModel = ref.read(mainUiViewModelProvider.notifier);
    final controller = useDraggableScrollableController();

    showUserProblemDetailSheet() {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          context: context,
          elevation: 0.0,
          useSafeArea: true,
          enableDrag: true,
          backgroundColor: Colors.transparent,
          barrierColor: const Color(0xff000000).withOpacity(.1),
          builder: (context) => const UserProblemDetailSheet());
    }

    useEffect(() {
      listener() {
        mainUiViewModel
            .onEvent(MainUiEvent.userScrolled(extent: controller.size));
      }

      controller.addListener(listener);

      return () {
        controller.removeListener(listener);
      };
    }, [controller]);
    const maxSheetSize = 1.0;
    const snapSheetSize = 0.85;
    const minSheetSize = 0.6;
    final mediaQuery = MediaQuery.of(context);
    final paddingTop = mediaQuery.padding.top;
    final theme = Theme.of(context);
    final size = mediaQuery.size;
    final maxHeight = size.height;
    final dateWidgetHeight = (size.width - 16 * 6) / 6;
    final titleHeight = dateWidgetHeight + 16;
    final totalTopWidgetHeight =
        (maxHeight - 2 * titleHeight - paddingTop) * 0.4;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: [
            SizedBox(
              height: 25,
              child: IconImageWidget(
                path: ImagePath.logo,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 30,
              child: IconImageWidget(
                path: ImagePath.appName,
              ),
            ),
          ],
        ),
        actions: const [
          SettingIconView(),
        ],
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
            top: titleHeight +
                (mainUiState.snapProgress - 1) * totalTopWidgetHeight,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SizedBox(
                height: totalTopWidgetHeight,
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: showUserProblemDetailSheet,
                        child: Opacity(
                          opacity: mainUiState.userStateOpacity,
                          child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: UserProfileSummaryView(),
                                  ),
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  Expanded(
                                    child: UserResolutionRateSummaryView(),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: MainUiDateView()),
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
                  height: titleHeight,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "해결 기록",
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
                      controller: controller,
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
