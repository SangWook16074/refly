import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_state.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/login_ui_view_model.dart';
import 'package:solution_diary_app/src/feature/auth/ui/views/login_button_view.dart';

class LoginUI extends ConsumerWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginUiState = ref.watch(loginUiViewModelProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 55),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff000025),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0))),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 150,
                          child: IconImageWidget(path: ImagePath.logo),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 80,
                              child: IconImageWidget(path: ImagePath.appName),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "나의 삶을 기록하는 습관",
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Roboto"),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              const Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginButtonView(),
                        ],
                      ),
                    )),
              ),
            ],
          ),
          if (loginUiState is Progress)
            ModalBarrier(
              dismissible: false,
              color: const Color(0xff000000).withAlpha((255 * 0.1).round()),
            ),
          const Center(child: CircularProgressIndicator.adaptive()),
        ],
      ),
    );
  }
}
