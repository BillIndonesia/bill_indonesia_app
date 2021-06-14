import 'dart:async';

import '../../packages/user/repository/auth_repository.dart';
import '../../packages/core_handler/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_phone_number_bloc.freezed.dart';
part 'sign_in_phone_number_event.dart';
part 'sign_in_phone_number_state.dart';

class SignInPhoneNumberBloc
    extends Bloc<SignInPhoneNumberEvent, SignInPhoneNumberState> {
  SignInPhoneNumberBloc(
    this.authRepo,
  ) : super(
          SignInPhoneNumberState.initial(),
        );
  final AuthRepository authRepo;

  @override
  Stream<SignInPhoneNumberState> mapEventToState(
    SignInPhoneNumberEvent event,
  ) async* {
    yield* event.map(
      phoneNumberFormChanged: (event) async* {
        yield state.copyWith(
          phoneNumber: event.phoneNumber,
        );
      },
      pinFormSubmitted: (event) async* {
        yield state.copyWith(
          showErrorMessages: true,
        );
        if (state.isPinFormValid) {
          yield state.copyWith(
            formStatus: FormSubmitting(),
            showErrorMessages: true,
          );
          try {
            bool userRegistered;
            userRegistered = await authRepo.signinPhoneNumber(
              state.phoneNumber,
            );
            if (userRegistered) {
              yield state.copyWith(
                formStatus: SubmissionSuccess(),
              );
            } else {
              yield state.copyWith(
                formStatus: SubmissionFailed(),
              );
            }
          } catch (e) {
            yield state.copyWith(
              formStatus: SubmissionError(Exception(e)),
            );
          }
        }
      },
      termAndConditionChecked: (event) async* {
        yield state.copyWith(
          isTermAndConditionChecked: !state.isTermAndConditionChecked,
        );
      },
    );
  }
}
