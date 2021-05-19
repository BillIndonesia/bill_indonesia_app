import 'dart:async';

import 'package:bill/application/global/form_submission_status.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:bill/application/sign_in/auth_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepo;
  SignInBloc({
    required this.authRepo,
  }) : super(
          SignInState(
            phoneNumber: '',
            pinNumber: '',
            formStatus: const InitialFormStatus(),
            isInitial: true,
            isTermAndConditionChecked: false,
            phoneNumberSubmittingStatus: '',
            isValidPassword: '',
            failedSubmittingPin: 0,
            suspendTimer: 60,
          ),
        );

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    //PhoneNUmber Form Field Changed Event
    if (event is SigninPhoneNumberFormChanged) {
      print('Even Phone Number ${event.phoneNumber}');
      yield state.copyWith(
        phoneNumber: event.phoneNumber,
        phoneNumberSubmittingStatus: '',
      );
    }
    //Term And Condition Checkbox Pressed
    else if (event is TermAndConditionCheckBoxPressed) {
      yield state.copyWith(
        isTermAndConditionChecked: !state.isTermAndConditionChecked,
      );
    }
    //Button Pressed Event
    else if (event is SignInPhoneNumberSubmitted) {
      if (state.isValidPhoneNumber) {
        yield state.copyWith(
          formStatus: FormSubmitting(),
          isInitial: false,
        );
        try {
          final response = await authRepo.signinPhoneNumber(state.phoneNumber);
          if (response) {
            yield state.copyWith(
              formStatus: SubmissionSuccess(),
              phoneNumberSubmittingStatus: 'Phone Number Registered',
            );
          } else {
            yield state.copyWith(
              formStatus: SubmissionSuccess(),
              phoneNumberSubmittingStatus: 'Phone Number Unregistered',
            );
          }
        } catch (e) {
          yield state.copyWith(
            formStatus: SubmissionFailed(
              Exception(e),
            ),
          );
        }
      }
      yield state.copyWith(
        isInitial: false,
      );
    }

    //------------------------------ignInPin-----------------------------------//
    if (event is SignInPinFormChanged) {
      print('Even Phone Number ${event.pin}');
      yield state.copyWith(
        pinNumber: event.pin,
        phoneNumberSubmittingStatus: '',
        isValidPassword: '',
      );
    }
    //pin Submitted
    else if (event is SignInPinSubmitted) {
      if (state.pinFormValidator) {
        yield state.copyWith(
          formStatus: FormSubmitting(),
          isInitial: false,
        );
        try {
          final response = await authRepo.signinPin(
            '05',
            state.pinNumber,
          );
          print(response);
          if (response) {
            yield state.copyWith(
              isInitial: false,
              isValidPassword: '',
              formStatus: SubmissionSuccess(),
              failedSubmittingPin: 0,
            );
          } else {
            yield state.copyWith(
              isInitial: false,
              isValidPassword: 'wrong pin',
              failedSubmittingPin: state.failedSubmittingPin + 1,
              suspendTimer: 60,
              formStatus: SubmissionSuccess(),
            );
          }
        } catch (e) {
          yield state.copyWith(
            formStatus: SubmissionFailed(
              Exception(e),
            ),
          );
        }
      }
      yield state.copyWith(
        isInitial: false,
      );
    }
    //Suspended Timer
    else if (event is SuspendedTimer) {
      if (event.suspendedTimer == 0) {
        yield state.copyWith(
          suspendTimer: event.suspendedTimer,
          isValidPassword: '',
          failedSubmittingPin: 0,
        );
      }
      yield state.copyWith(
        suspendTimer: event.suspendedTimer,
      );
    }
  }
}
