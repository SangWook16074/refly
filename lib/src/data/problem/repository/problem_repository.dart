import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';

part 'problem_repository.g.dart';

@riverpod
Future<List<Problem>> getAllProblems(Ref ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return [
    // Problem(
    //     id: 1,
    //     title: "안녕",
    //     content: "하세요",
    //     isDone: true,
    //     createAt: DateTime.now())
  ];
}
