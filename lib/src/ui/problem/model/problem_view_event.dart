import 'package:equatable/equatable.dart';
import 'package:solution_diary_app/src/data/problem/dtos/problem_request_dto.dart';
import 'package:solution_diary_app/src/data/problem/entity/problem.dart';

sealed class ProblemViewEvent extends Equatable {}

/// 기록 생성 이벤트
///
/// 사용자는 새로운 기록을 생성하기 위해서 [CreateProblem]이벤트를 생성합니다.
/// 해당 이벤트의 [problem]은 생성될 기록으로 [ProblemRequestDto]타입입니다.
final class CreateProblem extends ProblemViewEvent {
  final ProblemRequestDto problem;

  CreateProblem({required this.problem});

  @override
  List<Object?> get props => [problem];
}

/// 기록 읽어오기 이벤트
final class ReadProblemList extends ProblemViewEvent {
  @override
  List<Object?> get props => throw [];
}

/// 기록 수정 이벤트
final class UpdateProblem extends ProblemViewEvent {
  final Problem problem;

  UpdateProblem({required this.problem});

  @override
  List<Object?> get props => [problem];
}

/// 기록 삭제 이벤트
final class DeleteProblem extends ProblemViewEvent {
  final int id;

  DeleteProblem({required this.id});

  @override
  List<Object?> get props => [id];
}
