import 'package:bill/packages/user/repository/auth_repository.dart';
import 'package:bill/sign_in_phone_number/bloc/sign_in_phone_number_bloc.dart';
import 'package:bill/sign_up_otp/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _phoneNumber =
        context.read<SignInPhoneNumberBloc>().state.phoneNumber;
    return BlocProvider(
      create: (context) => SignUpBloc(AuthRepository())
        ..add(
          GetOtpScreenInit(
            _phoneNumber,
          ),
        ),
      child: SignUpOTPScreen(),
    );
  }
}

class SignUpOTPScreen extends StatelessWidget {
  final GlobalKey<FormState> _otpformKey = GlobalKey();
  final bool init = true;

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage('assets/images/bgpolos.png'),
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
                      'assets/images/otp.png',
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
                      listenWhen: (prevState, state) {
                        if (prevState.errorMessages == state.errorMessages) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                      listener: (context, state) {
                        if (state.errorMessages == 'pin benar') {
                          //TODO change to replacement later
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
                    SignUpOtpTimer(),
                    //Kirim Ulang
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

class SignUpOtpTimer extends StatefulWidget {
  @override
  _SignUpOtpTimerState createState() => _SignUpOtpTimerState();
}

class _SignUpOtpTimerState extends State<SignUpOtpTimer> {
  CountdownTimerController? controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(
      endTime: endTime,
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CountdownTimer(
          controller: controller,
          endTime: endTime,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return Text(
                '00:00',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                ),
              );
            }
            return Text(
              time.sec! < 10 ? "\n\n00 : 0${time.sec}" : "\n\n00 : ${time.sec}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
            );
          },
        ),
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
                BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (controller!.isRunning) {
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
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: Colors.black54,
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.07,
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
                            reverseAnimation: StyledToastAnimation.fade,
                          );
                        } else {
                          context.read<SignUpBloc>().add(
                                ResendOtp('05'),
                              );
                          setState(
                            () {
                              controller = CountdownTimerController(
                                endTime: DateTime.now().millisecondsSinceEpoch +
                                    1000 * 60,
                              );
                            },
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
      ],
    );

    // return BlocConsumer<SignUpBloc, SignUpState>(
    //   listener: (context, state) {
    //     int start = state.waitingTimer;
    //   },
    //   builder: (context, state) {
    //     return Container(
    //       width: MediaQuery.of(context).size.width * 0.12,
    //       child: FittedBox(
    //         child: BlocBuilder<SignUpBloc, SignUpState>(
    //           builder: (context, state) {
    //             return Text(
    //               state.waitingTimer < 10
    //                   ? "\n\n00 : 0${state.waitingTimer}"
    //                   : "\n\n00 : ${state.waitingTimer}",
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16,
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
