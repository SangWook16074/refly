import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solution_diary_app/src/core/ui/views/main_ui.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/agreement_ui_view_model.dart';
import 'package:solution_diary_app/src/feature/auth/ui/views/agreement_ui.dart';

class Onboard extends ConsumerWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAgreementState = ref.watch(agreementUiViewModelProvider);
    return userAgreementState.when(data: (bool hasconsentedtopolicy) {
      if (hasconsentedtopolicy) {
        return const MainUI();
      } else {
        return const AgreementUI();
      }
    }, error: (Object error, StackTrace stackTrace) {
      return Container();
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    });
  }
}
