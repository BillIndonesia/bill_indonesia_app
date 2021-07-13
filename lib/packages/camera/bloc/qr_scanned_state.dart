part of 'qr_scanned_bloc.dart';

enum ScannedType { empty, notFound, voucher, angkot }
enum TransactionStatus { none, success, failed }

@freezed
class QrScannedState with _$QrScannedState {
  const factory QrScannedState({
    required FormSubmissionStatus formStatus,
    required ScannedType type,
    required TransactionStatus transactionStatus,
    required Map<String, dynamic> transactionData,
  }) = _QrScannedState;

  factory QrScannedState.initial() => QrScannedState(
        formStatus: InitialFormStatus(),
        type: ScannedType.empty,
        transactionStatus: TransactionStatus.none,
        transactionData: {},
      );
}
