import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_agreement_state_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/logout_usecase_provider.dart';
import 'package:solution_diary_app/src/core/providers/update_user_agreement_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/auth/ui/viewModels/agreement_ui_event.dart';

part 'agreement_ui_view_model.g.dart';

@riverpod
class AgreementUiViewModel extends _$AgreementUiViewModel {
  @override
  Future<bool> build() async {
    try {
      return await ref.read(getUserAgreementStateUsecaseProvider).call();
    } on Exception catch (e) {
      log(e.toString());

      return false;
    }
  }

  onEvent(AgreementUiEvent event) {
    event.when(userAgreeButtonTaped: () async {
      log("user agree button taped");
      try {
        await ref.read(updateUserAgreementUsecaseProvider).call();
        state = const AsyncData(true);
      } catch (e) {
        log(e.toString());
        state = const AsyncData(false);
      }
    });
  }
}
