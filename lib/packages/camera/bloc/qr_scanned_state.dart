part of 'qr_scanned_bloc.dart';

@freezed
class QrScannedState with _$QrScannedState {
  const factory QrScannedState({
    required FormSubmissionStatus formStatus,
  }) = _QrScannedState;

  factory QrScannedState.initial() => QrScannedState(
        formStatus: InitialFormStatus(),
      );
}
