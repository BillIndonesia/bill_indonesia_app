import '../../../packages/core_handler/form_submission_status.dart';
import '../../../packages/widgets/auth_button_decoration.dart';
import '../../bloc/sign_in_phone_number_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneNumberButton extends StatelessWidget {
  const SignInPhoneNumberButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInPhoneNumberBloc, SignInPhoneNumberState>(
      listenWhen: (prevState, state) {
        return prevState.formStatus == state.formStatus ? false : true;
      },
      listener: (context, state) {
        if (state.formStatus is SubmissionSuccess) {
          Navigator.of(context).pushNamed('/SignInPinScreen');
        } else if (state.formStatus is SubmissionFailed) {
          Navigator.of(context).pushNamed('/SignUpOtpScreen');
          // context.read<SignUpBloc>().add(GetOtpScreenInit(state.phoneNumber));
        }
        if (state.formStatus is SubmissionError) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  alignment: Alignment.center,
                  child: Text('Periksa koneksi internet anda'),
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
                  _formKey.currentState!.validate();
                  context.read<SignInPhoneNumberBloc>().add(
                        PhoneNumberSubmitted(state.phoneNumber),
                      );
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
