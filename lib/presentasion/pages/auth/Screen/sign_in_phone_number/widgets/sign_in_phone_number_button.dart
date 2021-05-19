import 'package:bill/application/auth/bloc/sign_in_bloc.dart';
import 'package:bill/application/global/form_submission_status.dart';
import 'package:bill/presentasion/pages/auth/widgets/auth_button_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneNumberButton extends StatelessWidget {
  const SignInPhoneNumberButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })   : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        print(state.phoneNumberSubmittingStatus);
        if (state.phoneNumberSubmittingStatus == 'Phone Number Registered') {
          Navigator.of(context).pushNamed('/SignInPinScreen');
        } else if (state.phoneNumberSubmittingStatus ==
            'Phone Number Unregistered') {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.center,
                  child: Text(
                    'Nomor Tidak \n Terdaftar',
                  ),
                ),
              );
            },
          );
        }
      },
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
                  if (state.formStatus is SignInPhoneNumberSubmitted) {
                  } else {
                    if (_formKey.currentState!.validate()) {}
                    context.read<SignInBloc>().add(
                          SignInPhoneNumberSubmitted(),
                        );
                  }
                },
                child: Visibility(
                  visible: state.isTermAndConditionChecked,
                  child: AuthButtonDecoration(title: 'masuk'),
                ),
              );
      },
    );
  }
}
