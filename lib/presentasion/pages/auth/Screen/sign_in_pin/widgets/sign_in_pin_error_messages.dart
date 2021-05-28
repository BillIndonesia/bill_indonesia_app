import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPinErrorMessages extends StatelessWidget {
  const SignInPinErrorMessages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Visibility(
          visible: state.isInitial ? false : true,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: Text(
                state.isSuspended
                    ? 'Login Kembali setelah \n ${state.suspendTimer} detik'
                    : !state.pinFormValidator
                        ? 'Isi Semua Kolom'
                        : state.isValidPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
