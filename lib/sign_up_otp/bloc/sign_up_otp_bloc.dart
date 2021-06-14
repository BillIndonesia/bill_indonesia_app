import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_otp_event.dart';
part 'sign_up_otp_state.dart';

class SignUpOtpBloc extends Bloc<SignUpOtpEvent, SignUpOtpState> {
  SignUpOtpBloc() : super(SignUpOtpInitial());

  @override
  Stream<SignUpOtpState> mapEventToState(
    SignUpOtpEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
