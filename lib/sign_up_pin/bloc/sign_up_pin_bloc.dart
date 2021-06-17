import 'dart:async';

import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_pin_bloc.freezed.dart';
part 'sign_up_pin_event.dart';
part 'sign_up_pin_state.dart';

class SignUpPinBloc extends Bloc<SignUpPinEvent, SignUpPinState> {
  SignUpPinBloc() : super(SignUpPinState.initial());

  @override
  Stream<SignUpPinState> mapEventToState(
    SignUpPinEvent event,
  ) async* {
    yield* event.map(
      pinFormChanged: (event) async* {
        yield state.copyWith(
          pinNumber: event.pinNumber,
        );
      },
      pinConfirmationFormChanged: (event) async* {
        bool pinNumberIsMatch =
            event.pinNumber.length == 6 && event.pinNumber == state.pinNumber;
        bool pinNumberIsNotMatch =
            event.pinNumber.length == 6 && event.pinNumber != state.pinNumber;
        yield state.copyWith(
          pinNumberConfirmation: event.pinNumber,
          showErrorMessages: false,
        );
        if (pinNumberIsMatch) {
          yield state.copyWith(
            formStatus: SubmissionSuccess(),
          );
        } else if (pinNumberIsNotMatch) {
          yield state.copyWith(
            showErrorMessages: true,
            formStatus: SubmissionFailed(),
          );
        }
      },
    );
  }
}
