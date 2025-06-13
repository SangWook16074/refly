import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_update_view_event.freezed.dart';

@freezed
sealed class ProblemUpdateViewEvent with _$ProblemUpdateViewEvent {
  const factory ProblemUpdateViewEvent.titleChanged({
    required String title,
  }) = _TitleChanged;
  const factory ProblemUpdateViewEvent.contentChanged({
    required String content,
  }) = _ContentChanged;

  const factory ProblemUpdateViewEvent.solutionChanged({
    required String solution,
  }) = _SolutionChanged;
}
