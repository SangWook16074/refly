import 'package:equatable/equatable.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';

sealed class ProblemViewEvent extends Equatable {}

final class CreateProblem extends ProblemViewEvent {
  final Problem problem;

  CreateProblem({required this.problem});

  @override
  List<Object?> get props => [];
}

final class ReadProblemList extends ProblemViewEvent {
  @override
  List<Object?> get props => throw [];
}

final class UpdateProblem extends ProblemViewEvent {
  final Problem problem;

  UpdateProblem({required this.problem});

  @override
  List<Object?> get props => [];
}

final class DeleteProblem extends ProblemViewEvent {
  final int id;

  DeleteProblem({required this.id});

  @override
  List<Object?> get props => [];
}
