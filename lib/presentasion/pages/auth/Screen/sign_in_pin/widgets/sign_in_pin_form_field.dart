import 'dart:async';

import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/widgets/sign_in_pin_error_dialog.dart';
import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/widgets/sign_in_pin_suspended_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lottie/lottie.dart';
import 'package:bill/application/auth/sign_in_pin_bloc/sign_in_pin_bloc.dart';
import 'package:bill/application/global/form_submission_status.dart';

class SignInPinFormField extends StatefulWidget {
  const SignInPinFormField({
    Key? key,
    required GlobalKey<FormState> pinformKey,
  })  : _pinformKey = pinformKey,
        super(key: key);

  final GlobalKey<FormState> _pinformKey;

  @override
  _SignInPinFormFieldState createState() => _SignInPinFormFieldState();
}

class _SignInPinFormFieldState extends State<SignInPinFormField> {
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  final TextEditingController _pinController = TextEditingController();
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
    return BlocConsumer<SignInPinBloc, SignInPinState>(
      listener: (context, state) {
        if (state.showErrorMessages) {
          errorController!.add(
            ErrorAnimationType.shake,
          );
        }
        if (state.formStatus is SubmissionError) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  alignment: Alignment.center,
                  child: Text('Periksa koneksi internet anda'),
                ),
              );
            },
          );
        }
        if (state.formStatus is SubmissionSuccess) {}
        if (state.formStatus is SubmissionFailed) {
          if (state.suspendedTimer == 5) {
            showDialog(
              context: context,
              builder: (context) {
                return SignInPinErrorDialog();
              },
            );
          }
        }
      },
      builder: (context, state) {
        return Form(
          key: widget._pinformKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.height * 0.05,
                ),
                child: PinCodeTextField(
                  onChanged: (text) {},
                  appContext: context,
                  controller: _pinController,
                  errorAnimationController: errorController,
                  length: 6,
                  enabled: false,
                  obscureText: true,
                  autoDisposeControllers: true,
                  obscuringCharacter: '◉',
                  blinkWhenObscuring: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  showCursor: true,
                  keyboardType: TextInputType.number,
                  errorTextSpace: 30,
                  pinTheme: PinTheme(
                    disabledColor: !state.showErrorMessages &&
                            state.formStatus is! SubmissionSuccess
                        ? Colors.white
                        : state.formStatus is SubmissionSuccess
                            ? Colors.green
                            : Colors.red,
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.disabled
                      : AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (state.showErrorMessages) {
                      return '';
                    }
                  },
                ),
              ),
              Visibility(
                visible: state.formStatus is FormSubmitting,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Lottie.asset(
                    'assets/lottie/loading_Lottie.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Visibility(
                visible: state.showErrorMessages,
                child: Text(
                  state.errorMessages,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(50),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map(
                    (e) {
                      return RoundedButton(
                        title: '$e',
                        onTap: () {
                          if (_pinController.text.length < 6) {
                            _pinController.text = '${_pinController.text}$e';
                            context.read<SignInPinBloc>().add(
                                  PinFormChanged(
                                    _pinController.text,
                                    // '${state.pinNumber}e',
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  RoundedButton(
                    title: 'clear',
                    onTap: () {
                      print(state.pinNumber);
                      // _pinController.text = '';
                    },
                  ),
                  RoundedButton(
                    title: '0',
                    onTap: () {
                      _pinController.text = '${_pinController.text}0';
                    },
                  ),
                  RoundedButton(
                    title: '<-',
                    onTap: () {
                      if (_pinController.text.isNotEmpty) {
                        _pinController.text = _pinController.text
                            .substring(0, _pinController.text.length - 1);
                        context.read<SignInPinBloc>().add(
                              PinFormChanged(
                                _pinController.text,
                                // '${state.pinNumber}e',
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
              SignInPinSuspendedTimer(),
            ],
          ),
        );
      },
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  RoundedButton({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white12,
        ),
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
