import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_stat_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/main/domain/entities/user_stat.dart';
import 'package:solution_diary_app/src/feature/main/ui/viewModels/user_stat_view_event.dart';

part 'user_stat_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserStatViewModel extends _$UserStatViewModel {
  @override
  Future<UserStat> build() async {
    try {
      return await fetchUserStat();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  onEvent(UserStatViewEvent event) async {
    switch (event) {
      case RefreshUserStat():
        log("유저 스탯 변경");
        state = AsyncData(await fetchUserStat());
    }
  }

  Future<UserStat> fetchUserStat() async {
    final result = await ref.read(getUserStatUsecaseProvider).call();
    log(result.toString());
    return result;
  }
}
