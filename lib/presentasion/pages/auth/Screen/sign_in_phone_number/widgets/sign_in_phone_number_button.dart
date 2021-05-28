import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:bill/application/auth/sign_up_bloc/sign_up_bloc.dart';
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
        if (state.phoneNumberSubmitionStatus is SubmissionSuccess &&
            state.phoneNumberSubmittingStatus == 'Phone Number Registered') {
          context.read<SignInBloc>().add(
                CleanCache(),
              );
          Navigator.of(context).pushNamed('/SignInPinScreen');
        } else if (state.phoneNumberSubmitionStatus is SubmissionSuccess &&
            state.phoneNumberSubmittingStatus == 'Phone Number Unregistered') {
          context.read<SignInBloc>().add(
                CleanCache(),
              );
          context.read<SignUpBloc>().add(
                GetOtpScreenInit(state.phoneNumber),
              );
          Navigator.of(context).pushNamed('/SignUpGetOTP');
        }
      },
      builder: (context, state) {
        return state.phoneNumberSubmitionStatus is FormSubmitting
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
                  if (state.phoneNumberSubmitionStatus
                      is SignInPhoneNumberSubmitted) {
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
