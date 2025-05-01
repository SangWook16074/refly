import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/repository/problem_repository.dart';
import 'package:solution_diary_app/src/ui/problem/model/user_stat.dart';

part 'user_stat_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserStatViewModel extends _$UserStatViewModel {
  @override
  Future<UserStat> build() async {
    try {
      return await ref.read(problemRepositoryProvider).getUserStat();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
