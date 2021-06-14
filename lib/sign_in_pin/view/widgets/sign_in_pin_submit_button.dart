import '../../../packages/core_handler/form_submission_status.dart';
import '../../../packages/widgets/auth_button_decoration.dart';
import '../../bloc/sign_in_pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPinSubmitButton extends StatelessWidget {
  const SignInPinSubmitButton({
    Key? key,
    required GlobalKey<FormState> pinformKey,
  })  : _pinformKey = pinformKey,
        super(key: key);

  // ignore: unused_field
  final GlobalKey<FormState> _pinformKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInPinBloc, SignInPinState>(
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
            : Visibility(
                visible: state.isUserSuspended,
                child: GestureDetector(
                  onTap: () {
                    // _pinformKey.currentState!.validate();
                    // if (state.formStatus is SignInPhoneNumberSubmitted) {
                    // }
                    // //
                    // else {
                    //   context.read<SignInBloc>().add(
                    //         SignInPinSubmitted(
                    //           phoneNumber: '05',
                    //           pinNumber: state.pinNumber,
                    //         ),
                    //       );
                    // }
                  },
                  child: Visibility(
                    visible: state.isUserSuspended,
                    child: AuthButtonDecoration(
                      title: 'Lupa Pin',
                    ),
                  ),
                ),
              );
      },
    );
  }
}
