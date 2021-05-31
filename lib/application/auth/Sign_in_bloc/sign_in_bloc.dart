import 'dart:async';

import 'package:bill/application/global/form_submission_status.dart';
import 'package:bill/data/data_providers/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

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
            phoneNumberSubmitionStatus: const InitialFormStatus(),
            isInitial: true,
            isTermAndConditionChecked: false,
            phoneNumberSubmittingStatus: '',
            isValidPassword: '',
            failedSubmittingPin: 0,
            suspendTimer: 0,
          ),
        );

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    //PhoneNUmber Form Field Changed Event
    if (event is SigninPhoneNumberFormChanged) {
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
          phoneNumberSubmitionStatus: FormSubmitting(),
          isInitial: false,
        );
        try {
          final response = await authRepo.signinPhoneNumber(state.phoneNumber);
          if (response) {
            yield state.copyWith(
              isInitial: true,
              phoneNumberSubmitionStatus: SubmissionSuccess(),
              phoneNumberSubmittingStatus: 'Phone Number Registered',
            );
          } else {
            yield state.copyWith(
              phoneNumberSubmitionStatus: SubmissionSuccess(),
              phoneNumberSubmittingStatus: 'Phone Number Unregistered',
            );
          }
        } catch (e) {
          yield state.copyWith(
            phoneNumberSubmitionStatus: SubmissionFailed(),
          );
        }
      } else {
        yield state.copyWith(
          isInitial: false,
        );
      }
      yield state.copyWith(
        isInitial: true,
        phoneNumberSubmitionStatus: InitialFormStatus(),
      );
    }
    //CleaniT
    else if (event is CleanCache) {
      yield state.copyWith(phoneNumberSubmitionStatus: InitialFormStatus());
    }

    //------------------------------SignInPin-----------------------------------//
    if (event is SignInPinFormChanged) {
      yield state.copyWith(
        pinNumber: event.pin,
        phoneNumberSubmittingStatus: '',
        isValidPassword: '',
        formStatus: InitialFormStatus(),
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
            state.phoneNumber,
            state.pinNumber,
          );

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
            formStatus: SubmissionFailed(),
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
