import '../../bloc/sign_in_phone_number_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneNumberTermAndConditionCheckBoxAndText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //checkBox
          BlocBuilder<SignInPhoneNumberBloc, SignInPhoneNumberState>(
            builder: (context, state) {
              return Checkbox(
                activeColor: Color(0XFF0485AC),
                value: state.isTermAndConditionChecked,
                onChanged: (value) {
                  context.read<SignInPhoneNumberBloc>().add(
                        TermAndConditionChecked(),
                      );
                },
              );
            },
          ),
          Expanded(
            child: FittedBox(
              child: RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Setuju dengan '),
                    new TextSpan(
                      text: 'Ketentuan Layanan ',
                      style: new TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pushNamed('/TermConditionScreen');
                        },
                    ),
                    new TextSpan(text: 'dan '),
                    new TextSpan(
                      text: 'Kebijakan Privasi',
                      style: new TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pushNamed('/TermConditionScreen');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
