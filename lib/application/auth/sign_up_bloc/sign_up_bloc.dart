import 'dart:async';
import 'dart:math';

import 'package:bill/data/data_providers/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  SignUpBloc(
    this.authRepository,
  ) : super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    yield* event.map(
      otpFormChanged: (event) async* {
        yield state.copyWith(
          otpCode: event.otpCode,
        );
        if (event.otpCode.length == 4) {
          if (event.otpCode == state.otpCodeGenerated) {
            yield state.copyWith(
              showErrorMessages: false,
              errorMessages: 'pin benar',
            );
          } else {
            yield state.copyWith(
              showErrorMessages: true,
              errorMessages: 'Kode Anda Salah',
            );
          }
        }
      },
      getOtpScreenInit: (event) async* {
        // var otpCodeGenerator = int.parse(randomNumeric(4));
        var otpCodeGenerator = Random().nextInt(1000);
        var otpCode = otpCodeGenerator.toString().padRight(4, '0');
        print(otpCode);
        yield state.copyWith(
          otpCodeGenerated: otpCode,
          phoneNumber: event.phoneNumber,
          waitingTimer: 60,
        );
      },
      otpTimer: (event) async* {
        yield state.copyWith(
          waitingTimer: event.otpClock,
          errorMessages: '',
        );
      },
      resendOtp: (event) async* {
        var otpCodeGenerator = Random().nextInt(1000);
        var otpCode = otpCodeGenerator.toString().padRight(4, '0');
        print(otpCode);
        yield state.copyWith(otpCodeGenerated: otpCode);
      },
      cleanCache: cleanCache,
    );
  }

  Stream<SignUpState> cleanCache(event) async* {
    yield state.copyWith(
      waitingTimer: 0,
    );
  }
}
