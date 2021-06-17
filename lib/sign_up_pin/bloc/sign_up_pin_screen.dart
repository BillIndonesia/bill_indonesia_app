import 'package:bill/packages/widgets/numpad_button.dart';
import 'package:bill/sign_in_phone_number/view/widgets/sign_in_phone_number_header.dart';
import 'package:bill/sign_up_pin/bloc/sign_up_pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpPinScreen extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpPinBloc, SignUpPinState>(
      listenWhen: (previousState, state) {
        return previousState.pinNumber.length == 6 ? false : true;
      },
      listener: (context, state) {
        if (state.pinNumber.length == 6) {
          Navigator.of(context).pushNamed('/SignUpConfirmationPinScreen');
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgpolos.png'),
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
                        BlocBuilder<SignUpPinBloc, SignUpPinState>(
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.05,
                                left: MediaQuery.of(context).size.height * 0.05,
                                right:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              child: PinCodeTextField(
                                onChanged: (text) {},
                                appContext: context,
                                controller: _pinController,
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
                                  disabledColor: Colors.white,
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
                            );
                          },
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
                                return NumpadButton(
                                  title: '$e',
                                  onTap: () {
                                    if (_pinController.text.length < 6) {
                                      _pinController.text =
                                          '${_pinController.text}$e';
                                      context.read<SignUpPinBloc>().add(
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
                            NumpadButton(
                              title: 'clear',
                              onTap: () {
                                _pinController.text = '';
                              },
                            ),
                            NumpadButton(
                              title: '0',
                              onTap: () {
                                _pinController.text = '${_pinController.text}0';
                              },
                            ),
                            NumpadButton(
                              title: '<-',
                              onTap: () {
                                if (_pinController.text.isNotEmpty) {
                                  _pinController.text = _pinController.text
                                      .substring(
                                          0, _pinController.text.length - 1);
                                  context.read<SignUpPinBloc>().add(
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
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
