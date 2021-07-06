import 'dart:async';
import 'package:bill/packages/camera/data/camera_repository.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scanned_bloc.freezed.dart';
part 'qr_scanned_event.dart';
part 'qr_scanned_state.dart';

class QrScannedBloc extends Bloc<QrScannedEvent, QrScannedState> {
  final CameraRepository cameraRepo;
  QrScannedBloc({required this.cameraRepo}) : super(QrScannedState.initial());

  @override
  Stream<QrScannedState> mapEventToState(
    QrScannedEvent event,
  ) async* {
    print('do this $event');
    yield* event.map(
      qrCodeScanned: (event) async* {
        yield state.copyWith(
          formStatus: FormSubmitting(),
        );
        if (event.qrCode.substring(0, 1) == '#') {
          try {
            bool topUpViaVoucherIsSucces =
                await cameraRepo.scanVoucher(event.qrCode);
            if (topUpViaVoucherIsSucces) {
              yield state.copyWith(
                  formStatus: SubmissionSuccess(),
                  type: ScannedType.voucher,
                  transactionStatus: TransactionStatus.success);
            } else {
              yield state.copyWith(
                  formStatus: SubmissionSuccess(),
                  type: ScannedType.voucher,
                  transactionStatus: TransactionStatus.failed);
            }
          } catch (e) {
            yield state.copyWith(
              formStatus: SubmissionError(
                Exception(e),
              ),
            );
          }
        } else {
          yield state.copyWith(
            formStatus: SubmissionSuccess(),
            type: ScannedType.angkot,
          );
        }
      },
    );
  }
}
