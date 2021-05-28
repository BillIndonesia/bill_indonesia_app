import 'dart:async';

import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:bill/application/global/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignInPinFormField extends StatefulWidget {
  const SignInPinFormField({
    Key? key,
    required GlobalKey<FormState> pinformKey,
  })   : _pinformKey = pinformKey,
        super(key: key);

  final GlobalKey<FormState> _pinformKey;

  @override
  _SignInPinFormFieldState createState() => _SignInPinFormFieldState();
}

class _SignInPinFormFieldState extends State<SignInPinFormField> {
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.isValidPassword == 'wrong pin') {
          widget._pinformKey.currentState!.validate();
          errorController!.add(ErrorAnimationType.shake);
          if (state.isSuspended) {}
        } else {
          if (state.formStatus is SubmissionSuccess) {
            Navigator.of(context).pushNamed('/HomeScreen');
          }
        }
      },
      builder: (context, state) {
        return Form(
          key: widget._pinformKey,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.15,
              left: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.height * 0.05,
            ),
            child: PinCodeTextField(
              appContext: context,
              errorAnimationController: errorController,
              length: 6,
              enabled:
                  !state.isSuspended && state.formStatus is! FormSubmitting,
              obscureText: true,
              autoDismissKeyboard: true,
              autoDisposeControllers: true,
              obscuringCharacter: '◉',
              blinkWhenObscuring: true,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              showCursor: false,
              keyboardType: TextInputType.number,
              errorTextSpace: 30,
              pinTheme: PinTheme(
                borderRadius: BorderRadius.circular(5),
                inactiveColor: state.isInitial
                    ? Colors.white
                    : !state.pinFormValidator ||
                            state.isValidPassword == 'wrong pin'
                        ? Colors.red
                        : Colors.green,
                activeColor: state.pinFormValidator
                    ? state.isValidPassword == 'wrong pin'
                        ? Colors.red
                        : Colors.green
                    : state.isInitial
                        ? Colors.white
                        : !state.pinFormValidator ||
                                state.isValidPassword == 'wrong pin'
                            ? Colors.red
                            : Colors.lightBlue,
                selectedColor: state.isInitial
                    ? Colors.lightBlue
                    : !state.pinFormValidator ||
                            state.isValidPassword == 'wrong pin'
                        ? Colors.red
                        : Colors.green,
                fieldHeight: 50,
                fieldWidth: 40,
              ),
              onChanged: (text) {
                context.read<SignInBloc>().add(
                      SignInPinFormChanged(
                        pin: text,
                      ),
                    );
                if (!state.isSuspended && state.pinNumber.length == 5) {
                  context.read<SignInBloc>().add(
                        SignInPinSubmitted(
                          phoneNumber: state.phoneNumber,
                          pinNumber: state.pinNumber,
                        ),
                      );
                }
              },
              autovalidateMode: state.isInitial
                  ? AutovalidateMode.disabled
                  : AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (state.pinFormValidator) {
                  return null;
                }
                return '';
              },
            ),
          ),
        );
      },
    );
  }
}
