import 'dart:async';

import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:bill/application/auth/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpOTPScreen extends StatelessWidget {
  final GlobalKey<FormState> _otpformKey = GlobalKey();
  final bool init = true;

  @override
  Widget build(BuildContext context) {
    final b = context.read<SignInBloc>().state.phoneNumber;
    print(b);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bgpolos.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25 -
                      (MediaQuery.of(context).viewInsets.bottom * 0.25),
                ),
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'images/otp.png',
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                    //Sub Header
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.005,
                      ),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: FittedBox(
                        child: BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return RichText(
                              text: TextSpan(
                                text: "Masukan kode yang dikirim ke ",
                                children: [
                                  TextSpan(
                                    text: state.phoneNumber,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      ),
                    ),
                    //Sign-Up Otp
                    BlocConsumer<SignUpBloc, SignUpState>(
                      listener: (context, state) {
                        if (state.errorMessages == 'pin benar') {
                          Navigator.of(context).pushNamed('/SignUpPinScreen');
                        }
                      },
                      builder: (context, state) {
                        return Form(
                          key: _otpformKey,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.01,
                              left: MediaQuery.of(context).size.height * 0.05,
                              right: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 4,
                              obscureText: true,
                              obscuringCharacter: '●',
                              blinkWhenObscuring: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                              ],
                              showCursor: false,
                              keyboardType: TextInputType.number,
                              errorTextSpace: 30,
                              pinTheme: PinTheme(
                                borderRadius: BorderRadius.circular(5),
                                inactiveColor: state.showErrorMessages == false
                                    ? Colors.black12
                                    : Colors.red,
                                activeColor: state.showErrorMessages == false
                                    ? Colors.white
                                    : Colors.red,
                                selectedColor: state.showErrorMessages == false
                                    ? Colors.white
                                    : Colors.red,
                                fieldHeight: 50,
                                fieldWidth: 50,
                              ),
                              onChanged: (text) {
                                print(text);
                                context.read<SignUpBloc>().add(
                                      OTPFormChanged(text),
                                    );
                              },
                              autovalidateMode: state.showErrorMessages == false
                                  ? AutovalidateMode.disabled
                                  : AutovalidateMode.onUserInteraction,
                            ),
                          ),
                        );
                      },
                    ),
                    //Timer CD Teks
                    BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        if (state.waitingTimer == 60) {
                          int start = state.waitingTimer;
                          const oneSec = const Duration(seconds: 1);
                          Timer.periodic(
                            oneSec,
                            (Timer timer) {
                              if (start < 1) {
                                timer.cancel();
                              } else {
                                start -= 1;
                                context.read<SignUpBloc>().add(
                                      OTPTimer(start),
                                    );
                              }
                            },
                          );
                        }
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: FittedBox(
                            child: BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                                return Text(
                                  state.waitingTimer < 10
                                      ? "\n\n00 : 0${state.waitingTimer}"
                                      : "\n\n00 : ${state.waitingTimer}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    //Kirim Ulang
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      width: MediaQuery.of(context).size.width * 0.52,
                      child: FittedBox(
                        child: Row(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Tidak menerima kode? ",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                children: [],
                              ),
                            ),
                            BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    if (state.waitingTimer == 0) {
                                      context.read<SignUpBloc>().add(
                                            OTPTimer(60),
                                          );
                                      context.read<SignUpBloc>().add(
                                            ResendOtp(b),
                                          );
                                    } else {
                                      showToastWidget(
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 18.0,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 50.0,
                                          ),
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            color: Colors.black54,
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          child: Center(
                                            child: Text(
                                              'Tunggu ${state.waitingTimer} detik',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        context: context,
                                        animation: StyledToastAnimation.fade,
                                        reverseAnimation:
                                            StyledToastAnimation.fade,
                                      );
                                    }
                                  },
                                  child: Text(
                                    " Kirim Ulang",
                                    style: TextStyle(
                                      color: Color(0xFFF4F7F8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // //Button
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.07,
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: MediaQuery.of(context).size.height * 0.03,
                    //       horizontal: 30),
                    //   child: ButtonTheme(
                    //     height: 50,
                    //     child: MaterialButton(
                    //       onPressed: () async {},
                    //       child: Center(
                    //         child: Container(
                    //           width: MediaQuery.of(context).size.width * 0.2,
                    //           child: FittedBox(
                    //             child: _isLoading == true
                    //                 ? Text(
                    //                     "Harap Tunggu",
                    //                     style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 18,
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 : Text(
                    //                     "Verifikasi",
                    //                     style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 18,
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF0A9ABC),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    // ),
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
