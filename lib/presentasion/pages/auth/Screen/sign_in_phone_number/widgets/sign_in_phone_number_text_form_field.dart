import 'package:bill/application/auth/bloc/sign_in_bloc.dart';
import 'package:bill/presentasion/pages/auth/widgets/auth_form_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneNumberTextFormField extends StatelessWidget {
  const SignInPhoneNumberTextFormField({
    Key? key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.width * 0.15,
            right: MediaQuery.of(context).size.width * 0.15,
          ),
          child: Form(
            key: _formKey,
            child: TextFormField(
              autovalidateMode: state.isInitial
                  ? AutovalidateMode.disabled
                  : AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                context.read<SignInBloc>().add(
                      SigninPhoneNumberFormChanged(
                        phoneNumber: value,
                      ),
                    );
              },
              validator: (_) => state.isValidPhoneNumber
                  ? null
                  : 'Masukkan Format Nomor Telpon yang sesuai',
              inputFormatters: [
                LengthLimitingTextInputFormatter(13),
              ],
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: Color(0xFF93CCDA),
                fontSize: 28.0,
                fontFamily: 'Montserrat',
              ),
              decoration:
                  AuthFormDecoration().signinPhoneNumberFormDecoration(),
              textAlign: TextAlign.center,
              showCursor: false,
              autofocus: false,
            ),
          ),
        );
      },
    );
  }
}
