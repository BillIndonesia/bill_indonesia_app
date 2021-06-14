import '../../bloc/sign_in_pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPinErrorMessages extends StatelessWidget {
  const SignInPinErrorMessages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInPinBloc, SignInPinState>(
      builder: (context, state) {
        return Visibility(
          visible: state.showErrorMessages ? false : true,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: Text(
                state.isUserSuspended
                    ? 'Login Kembali setelah \n ${state.suspendedTimer} detik'
                    : !state.isFormValid
                        ? 'Isi Semua Kolom'
                        : '',
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
