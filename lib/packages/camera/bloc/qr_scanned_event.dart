part of 'qr_scanned_bloc.dart';

@freezed
class QrScannedEvent with _$QrScannedEvent {
  const factory QrScannedEvent.qrCodeScanned(String qrCode) = QrCodeScanned;
  const factory QrScannedEvent.transaction(Map<String, dynamic> data) =
      Transaction;
}
