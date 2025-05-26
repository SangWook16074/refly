import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/core/providers/get_user_stat_usecase_provider.dart';
import 'package:solution_diary_app/src/feature/main/domain/entities/user_stat.dart';

part 'user_stat_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserStatViewModel extends _$UserStatViewModel {
  @override
  Future<UserStat> build() async {
    try {
      return await ref.read(getUserStatUsecaseProvider).call();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
