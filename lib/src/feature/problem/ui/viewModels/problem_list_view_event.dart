import 'package:equatable/equatable.dart';
import 'package:solution_diary_app/src/feature/problem/data/models/problem_model.dart';

sealed class ProblemListViewEvent extends Equatable {}

final class UnselectProblem extends ProblemListViewEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class SelectProblem extends ProblemListViewEvent {
  final int index;
  final ProblemModel? problem;

  SelectProblem({required this.index, this.problem});

  @override
  List<Object?> get props => [index, problem];
}

final class OpenProblemEditDialog extends ProblemListViewEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
