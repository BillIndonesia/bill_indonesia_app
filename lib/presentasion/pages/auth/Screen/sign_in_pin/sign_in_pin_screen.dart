import 'dart:async';

import 'package:bill/application/auth/bloc/sign_in_bloc.dart';
import 'package:bill/application/global/form_submission_status.dart';
import 'package:bill/presentasion/pages/auth/Screen/sign_in_phone_number/widgets/sign_in_phone_number_header.dart';
import 'package:bill/presentasion/pages/auth/widgets/auth_button_decoration.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
              child: Column(
                children: [
                  //Header
                  SigninPhoneNumberHeader(
                    header: 'PIN',
                  ),
                  //PinNumber Form Field
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return Form(
                        key: _pinformKey,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.15,
                            left: MediaQuery.of(context).size.height * 0.05,
                            right: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            obscureText: true,
                            obscuringCharacter: '*',
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
                                      ? Colors.lightBlue
                                      : !state.pinFormValidator ||
                                              state.isValidPassword ==
                                                  'wrong pin'
                                          ? Colors.red
                                          : Colors.green,
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
                  ),
                  //Error Messages
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.isInitial ? false : true,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: Text(
                              state.failedSubmittingPin >= 3
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
                  ),
                  //Dialog failed Submittin Pin =3
                  BlocListener<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state.suspendTimer == 59) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.005,
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFF4F7F8)),
                                width: MediaQuery.of(context).size.width * 0.7,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: FittedBox(
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: new TextSpan(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xFF999494),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat',
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text:
                                                    'Anda Telah Salah Memasukkan PIN sebanyak 3x\n',
                                              ),
                                              new TextSpan(
                                                text:
                                                    'Harap coba lagi setelah 60 detik',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: MaterialButton(
                                        child: FittedBox(
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(
                                                0xFF0B8CAD,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Container(),
                  ),
                  //Start Timer When Failed Submitting Pin == 3
                  BlocListener<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state.failedSubmittingPin == 3) {
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
                  ),
                  //SignInPin Button
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.formStatus is FormSubmitting
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05,
                              ),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _pinformKey.currentState!.validate();
                                if (state.formStatus
                                    is SignInPhoneNumberSubmitted) {
                                }
                                //
                                else {
                                  context.read<SignInBloc>().add(
                                        SignInPinSubmitted(
                                          phoneNumber: '05',
                                          pinNumber: state.pinNumber,
                                        ),
                                      );
                                }
                              },
                              child: Visibility(
                                visible: state.failedSubmittingPin < 3,
                                child: AuthButtonDecoration(
                                  title: 'masuk',
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
