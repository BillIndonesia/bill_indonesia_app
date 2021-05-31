import 'dart:async';

import 'package:bill/application/auth/sign_in_pin_bloc/sign_in_pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPinSuspendedTimer extends StatelessWidget {
  const SignInPinSuspendedTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInPinBloc, SignInPinState>(
      listener: (context, state) {
        if (state.isUserSuspended) {
          print(
              'status : ${state.isUserSuspended} cd : ${state.suspendedTimer} failed : ${state.failedSubmittingPin}');
          int start = state.suspendedTimer;
          const oneSec = const Duration(seconds: 1);
          Timer.periodic(
            oneSec,
            (Timer timer) {
              if (start < 1) {
                timer.cancel();
              } else {
                start -= 1;
                context.read<SignInPinBloc>().add(
                      SuspendedPinTimerClicker(start),
                    );
              }
            },
          );
        }
      },
      child: Container(),
    );
  }
}
