import 'package:freezed_annotation/freezed_annotation.dart';

part 'agreement_ui_event.freezed.dart';

@freezed
sealed class AgreementUiEvent with _$AgreementUiEvent {
  const factory AgreementUiEvent.userAgreeButtonTaped() =
      _$UserAgreeButtonTaped;
}
