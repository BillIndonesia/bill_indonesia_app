import '../../../packages/core_handler/form_submission_status.dart';
import '../../../packages/widgets/auth_form_decoration.dart';
import '../../bloc/sign_in_phone_number_bloc.dart';
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
    return BlocBuilder<SignInPhoneNumberBloc, SignInPhoneNumberState>(
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
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              onChanged: (value) {
                context.read<SignInPhoneNumberBloc>().add(
                      PhoneNumberFormChanged(value),
                    );
              },
              validator: (_) => state.isPinFormValid
                  ? null
                  : 'Masukkan Format Nomor Telpon yang sesuai',
              inputFormatters: [
                LengthLimitingTextInputFormatter(13),
              ],
              enabled: state.formStatus is FormSubmitting ? false : true,
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
