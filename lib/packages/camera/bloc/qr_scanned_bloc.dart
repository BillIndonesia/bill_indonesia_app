import 'dart:async';
import 'package:bill/packages/camera/data/camera_repository.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    yield* event.map(
      qrCodeScanned: (event) async* {
        yield state.copyWith(
          formStatus: FormSubmitting(),
        );
        try {
          var qrStatus = await cameraRepo.scanBarcode(event.qrCode);
          print(qrStatus['message']);
          print("data: ${qrStatus['data']}");
          //mesage not found
          if (qrStatus['message'] == 'not found') {
            yield state.copyWith(
                formStatus: SubmissionSuccess(),
                type: ScannedType.notFound,
                transactionStatus: TransactionStatus.none);
          }
          //message merchant
          else if (qrStatus['message'] == 'merchant') {
            yield state.copyWith(
              formStatus: SubmissionSuccess(),
              type: ScannedType.angkot,
              transactionStatus: TransactionStatus.success,
              transactionData: qrStatus['data'],
            );
          }
          //message voucher
          else if (qrStatus['message'] == 'voucher') {
            try {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? _phoneNumber = prefs.getString('nohp');
              var data = {
                "customer": _phoneNumber.toString(),
                "voucher": event.qrCode.toString(),
              };
              var transactionStatus = await cameraRepo.topupVoucher(data);
              if (transactionStatus == false) {
                yield state.copyWith(
                  formStatus: SubmissionSuccess(),
                  type: ScannedType.voucher,
                  transactionStatus: TransactionStatus.failed,
                );
              } else {
                yield state.copyWith(
                  formStatus: SubmissionSuccess(),
                  type: ScannedType.voucher,
                  transactionStatus: TransactionStatus.success,
                );
              }
            } catch (e) {
              print(e);
            }
          }
        } catch (e) {
          print("error camera $e");
          yield state.copyWith(
            formStatus: SubmissionError(
              Exception(e),
            ),
          );
        }
      },
      transaction: (event) async* {
        yield state.copyWith(
          formStatus: FormSubmitting(),
        );
        try {
          var transactionStatus = await cameraRepo.payment(event.data);
          print(transactionStatus);
          if (transactionStatus == false) {
            yield state.copyWith(
              formStatus: SubmissionSuccess(),
              type: ScannedType.angkot,
              transactionStatus: TransactionStatus.failed,
            );
          } else {
            yield state.copyWith(
              formStatus: SubmissionSuccess(),
              type: ScannedType.angkot,
              transactionStatus: TransactionStatus.success,
            );
          }
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
