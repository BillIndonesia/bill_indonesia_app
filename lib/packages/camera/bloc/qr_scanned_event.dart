part of 'qr_scanned_bloc.dart';

@freezed
class QrScannedEvent with _$QrScannedEvent {
  const factory QrScannedEvent.qrCodeScanned(String qrCode) = QrCodeScanned;
}
