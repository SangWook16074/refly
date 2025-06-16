import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/agreement_ui_event.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/agreement_ui_view_model.dart';

class AgreementUI extends ConsumerWidget {
  const AgreementUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreementUiViewModel =
        ref.read(agreementUiViewModelProvider.notifier);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 6,
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
                          width: 120,
                          child: IconImageWidget(path: ImagePath.logo),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 120,
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
                                  fontFamily: "Lobster"),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "리플라이 서비스를 이용하기 위해\n개인정보 수집 및 이용 동의를 해주세요!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "정보추체의 개인정보 및 권리 보호를 위해 개인정보 보호법 및 관계법령이 정한 바를 준수하여 안전하게 관리하고 있습니다. 자세한 사항은 개인정보처리방침에서 확인할 수 있습니다.",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 12,
                                  color: Color(0xff676767),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  agreementUiViewModel.onEvent(
                                      const AgreementUiEvent
                                          .userAgreeButtonTaped());
                                },
                                child: Container(
                                  margin: const EdgeInsetsDirectional.symmetric(
                                      vertical: 12.0),
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000025),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "동의하고 시작하기",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
          // if (loginUiState is Progress)
          //   Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       ModalBarrier(
          //         dismissible: false,
          //         color: const Color(0xff000000).withAlpha((255 * 0.1).round()),
          //       ),
          //       const Center(child: CircularProgressIndicator.adaptive()),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
