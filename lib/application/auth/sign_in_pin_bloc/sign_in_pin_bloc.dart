import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bill/application/global/form_submission_status.dart';
import 'package:bill/data/data_providers/auth/auth_repository.dart';

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
        if (event.pinNumber.length == 6) {
          yield state.copyWith(
            formStatus: FormSubmitting(),
          );
          try {
            bool response = await authRepo.signinPin(
              '05',
              event.pinNumber,
            );
            if (response == false) {
              yield state.copyWith(
                showErrorMessages: true,
                errorMessages: 'Kode Pin Salah',
                formStatus: SubmissionFailed(),
                failedSubmittingPin: state.failedSubmittingPin + 1,
              );
              if (state.failedSubmittingPin == 2) {
                yield state.copyWith(
                  failedSubmittingPin: state.failedSubmittingPin + 1,
                  suspendedTimer: 5,
                  showErrorMessages: true,
                  formStatus: SubmissionFailed(),
                );
              }
            } else {
              yield state.copyWith(
                showErrorMessages: false,
                errorMessages: '',
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
        }
      },
      pinFormSubmitted: (event) async* {
        print(state.pinNumber);

        yield state.copyWith(
          showErrorMessages: true,
          formStatus: FormSubmitting(),
        );
        Future.delayed(
          Duration(seconds: 1),
        );
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
        );
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
