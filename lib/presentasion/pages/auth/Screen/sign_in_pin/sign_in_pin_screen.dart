import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';

import 'package:bill/presentasion/pages/auth/Screen/sign_in_phone_number/widgets/sign_in_phone_number_header.dart';
import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/widgets/sign_in_pin_error_dialog.dart';

import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/widgets/sign_in_pin_form_field.dart';

import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/widgets/sign_in_pin_suspended_timer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class SignInPinScreen extends StatelessWidget {
  final GlobalKey<FormState> _pinformKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgpolos.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Header
                    SigninPhoneNumberHeader(
                      header: 'PIN',
                    ),
                    //PINumber Form Field
                    SignInPinFormField(pinformKey: _pinformKey),
                    BlocListener<SignInBloc, SignInState>(
                      listenWhen: (context, state) {
                        return state.isSuspended;
                      },
                      listener: (context, state) {
                        if (state.isSuspended && state.suspendTimer == 60) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return SignInPinErrorDialog();
                            },
                          );
                        }
                      },
                      child: Container(),
                    ),
                    SignInPinSuspendedTimer(),
                    //Pin Show Error
                    // SignInPinErrorMessages(),
                    //Dialog failed Submittin Pin =3
                    //Start Timer When Failed Submitting Pin == 3
                    //Sign-In Pin Submit Button
                    // SignInPinSubmitButton(pinformKey: _pinformKey),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
