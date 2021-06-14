import 'dart:async';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scanned_bloc.freezed.dart';
part 'qr_scanned_event.dart';
part 'qr_scanned_state.dart';

class QrScannedBloc extends Bloc<QrScannedEvent, QrScannedState> {
  QrScannedBloc() : super(QrScannedState.initial());

  @override
  Stream<QrScannedState> mapEventToState(
    QrScannedEvent event,
  ) async* {
    yield* event.map(
      qrCodeScanned: (event) async* {
        yield state.copyWith(
          formStatus: FormSubmitting(),
        );
        await Future.delayed(
          Duration(seconds: 3),
        );
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
        );
      },
    );
  }
}
