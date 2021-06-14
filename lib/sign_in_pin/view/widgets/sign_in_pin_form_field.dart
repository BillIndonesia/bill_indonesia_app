import 'dart:async';

import 'package:bill/sign_in_phone_number/bloc/sign_in_phone_number_bloc.dart';

import '../../../packages/core_handler/form_submission_status.dart';
import '../../../packages/widgets/numpad_button.dart';
import '../../bloc/sign_in_pin_bloc.dart';
import 'sign_in_pin_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      listenWhen: (prevState, state) {
        bool formStatusIsChanging = prevState.formStatus != state.formStatus;
        return formStatusIsChanging;
      },
      listener: (context, state) {
        if (state.formStatus is SubmissionFailed) {
          if (state.isUserSuspended) {
            showDialog(
              context: context,
              builder: (context) {
                return SignInPinErrorDialog();
              },
            );
          }
          errorController!.add(
            ErrorAnimationType.shake,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: widget._pinformKey,
          child: Column(
            children: [
              BlocConsumer<SignInPinBloc, SignInPinState>(
                listenWhen: (prevState, state) {
                  return !prevState.isPinFormValid && state.isPinFormValid;
                },
                listener: (context, state) {
                  if (state.isPinFormValid) {
                    String userPhoneNumber =
                        context.read<SignInPhoneNumberBloc>().state.phoneNumber;
                    context.read<SignInPinBloc>().add(
                          PinFormSubmitted(
                            phoneNumber: userPhoneNumber,
                            pinNumber: state.pinNumber,
                          ),
                        );
                  } else if (state.isUserSuspended) {
                    context.read<SignInPinBloc>().add(
                          SuspendedPinTimerClicker(60),
                        );
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.15,
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
                      blinkWhenObscuring: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      errorTextSpace: 30,
                      animationCurve: Curves.easeOut,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 200),
                      obscuringWidget: Icon(
                        Icons.circle_rounded,
                        color: !state.showErrorMessages &&
                                state.formStatus is! SubmissionSuccess
                            ? Colors.white30
                            : state.formStatus is SubmissionSuccess
                                ? Colors.green
                                : Colors.red,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        disabledColor: !state.showErrorMessages &&
                                state.formStatus is! SubmissionSuccess
                            ? Colors.white30
                            : state.formStatus is SubmissionSuccess
                                ? Colors.green
                                : Colors.red,
                        fieldHeight: 30,
                        fieldWidth: 40,
                      ),
                    ),
                  );
                },
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
                padding: EdgeInsets.all(40),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 'clear', 0].map(
                    (e) {
                      return NumpadButton(
                        title: '$e',
                        onTap: () {
                          if (e == 'clear') {
                            _pinController.text = '';
                            context.read<SignInPinBloc>().add(
                                  PinFormChanged(
                                    _pinController.text,
                                  ),
                                );
                          }
                          if (_pinController.text.length < 6) {
                            _pinController.text =
                                e == 'clear' ? '' : '${_pinController.text}$e';
                            context.read<SignInPinBloc>().add(
                                  PinFormChanged(
                                    _pinController.text,
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  NumpadButton(
                    title: '<-',
                    onTap: () {
                      if (_pinController.text.isNotEmpty) {
                        _pinController.text = _pinController.text
                            .substring(0, _pinController.text.length - 1);
                        context.read<SignInPinBloc>().add(
                              PinFormChanged(
                                _pinController.text,
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
