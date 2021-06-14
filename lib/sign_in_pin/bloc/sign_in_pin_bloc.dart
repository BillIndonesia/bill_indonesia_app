import 'dart:async';

import '../../packages/user/repository/auth_repository.dart';
import '../../packages/core_handler/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_pin_bloc.freezed.dart';
part 'sign_in_pin_event.dart';
part 'sign_in_pin_state.dart';

class SignInPinBloc extends Bloc<SignInPinEvent, SignInPinState> {
  final AuthRepository authRepo;
  SignInPinBloc(
    this.authRepo,
  ) : super(SignInPinState.initial());

  @override
  Stream<SignInPinState> mapEventToState(
    SignInPinEvent event,
  ) async* {
    yield* event.map(
      pinFormChanged: (event) async* {
        yield state.copyWith(
          pinNumber: event.pinNumber,
          formStatus: InitialFormStatus(),
          showErrorMessages: false,
        );
      },
      pinFormSubmitted: (event) async* {
        yield state.copyWith(
          formStatus: FormSubmitting(),
        );
        try {
          bool response = await authRepo.signinPin(
            event.phoneNumber,
            event.pinNumber,
          );
          if (response == false) {
            if (state.failedSubmittingPin == 2) {
              yield state.copyWith(
                showErrorMessages: true,
                formStatus: SubmissionFailed(),
                suspendedTimer: 5,
                errorMessages: 'Masukkan Pin setelah 5 detik',
                failedSubmittingPin: state.failedSubmittingPin + 1,
              );
            } else {
              yield state.copyWith(
                showErrorMessages: true,
                errorMessages: 'Kode Pin Salah',
                formStatus: SubmissionFailed(),
                failedSubmittingPin: state.failedSubmittingPin + 1,
              );
            }
          } else {
            yield state.copyWith(
              showErrorMessages: false,
              formStatus: SubmissionSuccess(),
              failedSubmittingPin: 0,
            );
          }
        } catch (e) {
          yield state.copyWith(
            showErrorMessages: false,
            errorMessages: '',
            formStatus: SubmissionError(
              Exception(e),
            ),
          );
        }
      },
      suspendedPinTimerClicker: (event) async* {
        if (event.suspendedTimer == 0) {
          yield state.copyWith(
            suspendedTimer: event.suspendedTimer,
            failedSubmittingPin: 0,
            showErrorMessages: false,
          );
        } else {
          yield state.copyWith(
            suspendedTimer: event.suspendedTimer,
            errorMessages: 'Masukkan Pin setelah ${event.suspendedTimer} detik',
          );
        }
      },
    );
  }
}
