import 'dart:async';

import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPinSuspendedTimer extends StatelessWidget {
  const SignInPinSuspendedTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.isSuspended) {
          int start = state.suspendTimer;
          const oneSec = const Duration(seconds: 1);
          Timer.periodic(
            oneSec,
            (Timer timer) {
              if (start < 1) {
                timer.cancel();
              } else {
                start -= 1;
                context.read<SignInBloc>().add(
                      SuspendedTimer(
                        suspendedTimer: start,
                      ),
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
