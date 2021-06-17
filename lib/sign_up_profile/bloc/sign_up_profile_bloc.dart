import 'dart:async';
import 'dart:io';

import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/packages/user/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'sign_up_profile_bloc.freezed.dart';
part 'sign_up_profile_event.dart';
part 'sign_up_profile_state.dart';

class SignUpProfileBloc extends Bloc<SignUpProfileEvent, SignUpProfileState> {
  SignUpProfileBloc(
    this.authRepo,
  ) : super(SignUpProfileState.initial());
  final AuthRepository authRepo;
  @override
  Stream<SignUpProfileState> mapEventToState(
    SignUpProfileEvent event,
  ) async* {
    yield* event.map(
      nameFormChanged: (event) async* {
        yield state.copyWith(
          name: event.name,
        );
      },
      bornPlaceFormChanged: (event) async* {
        yield state.copyWith(
          bornPlace: event.bornPlace,
        );
      },
      bornDateFormChanged: (event) async* {
        yield state.copyWith(
          bornDate: event.bornDate,
        );
      },
      knowUsFromChanged: (event) async* {
        yield state.copyWith(
          knowUsFrom: event.knowUsFrom,
        );
      },
      imageChanged: (event) async* {
        yield state.copyWith(
          imagePath: event.imagePath,
        );
      },
      formSubmitted: (event) async* {
        try {
          yield state.copyWith(
            formStatus: FormSubmitting(),
          );

          await Future.delayed(
            Duration(seconds: 1),
          );
          String _bornDate = DateFormat('yyyy-MM-dd').format(state.bornDate);
          print(_bornDate);
          await authRepo.signUpProfile(
            phoneNumber: event.phoneNumber,
            password: event.password,
            customerName: state.name,
            bornPlace: state.bornPlace,
            bornDate: _bornDate,
          );
          yield state.copyWith(
            showErrorMessages: true,
            formStatus: SubmissionSuccess(),
          );
        } catch (e) {
          yield state.copyWith(
            showErrorMessages: true,
            formStatus: SubmissionError(
              Exception(e),
            ),
          );
        }
      },
    );
  }
}
