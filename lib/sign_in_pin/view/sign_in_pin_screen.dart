import '../../packages/core_handler/form_submission_status.dart';
import '../../sign_in_phone_number/view/widgets/sign_in_phone_number_header.dart';
import '../bloc/sign_in_pin_bloc.dart';
import 'widgets/sign_in_pin_form_field.dart';
import 'widgets/sign_in_pin_suspended_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPinScreen extends StatelessWidget {
  final GlobalKey<FormState> _pinformKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocConsumer<SignInPinBloc, SignInPinState>(
        listenWhen: (prevState, state) {
          bool formIsChanging = prevState.formStatus != state.formStatus;
          return formIsChanging;
        },
        listener: (context, state) {
          if (state.formStatus is SubmissionFailed) {}
          if (state.formStatus is SubmissionSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/HomeScreen',
              (Route<dynamic> route) => false,
            );
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
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgpolos.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Header
                      SigninPhoneNumberHeader(
                        header: 'PIN',
                      ),
                      //PINumber Form Field
                      SignInPinFormField(pinformKey: _pinformKey),
                      SignInPinSuspendedTimer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
