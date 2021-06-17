import 'package:bill/Edit_profile/view/widgets/edit_profile_widgets.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/sign_in_phone_number/bloc/sign_in_phone_number_bloc.dart';
import 'package:bill/sign_up_pin/bloc/sign_up_pin_bloc.dart';
import 'package:bill/sign_up_profile/bloc/sign_up_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreenContent extends StatelessWidget {
  final tanggalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpProfileBloc, SignUpProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditProfileHeader(),
                    //Input Nama
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.width * 0.045,
                            0,
                          ),
                          child: Text(
                            'Nama',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF999494,
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<SignUpProfileBloc, SignUpProfileState>(
                          builder: (context, state) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                              ),
                              child: TextFormField(
                                autofocus: false,
                                autovalidateMode: state.showErrorMessages
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                onChanged: (teks) {
                                  context.read<SignUpProfileBloc>().add(
                                        NameFormChanged(teks),
                                      );
                                },
                                validator: (value) {
                                  if (state.name == '') {
                                    return 'Nama tidak boleh kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6C6565),
                                ),
                                textAlign: TextAlign.left,
                                decoration: new InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                      color: Colors.black87,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    //Input Tempat Lahir
                    BlocBuilder<SignUpProfileBloc, SignUpProfileState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.width * 0.045,
                                0,
                              ),
                              child: Text(
                                'Tempat Lahir',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(
                                    0xFF999494,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                              ),
                              child: TextFormField(
                                autovalidateMode: state.showErrorMessages
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                onChanged: (teks) {
                                  context.read<SignUpProfileBloc>().add(
                                        BornPlaceFormChanged(teks),
                                      );
                                },
                                validator: (value) {
                                  if (value == '') {
                                    return 'Tempat lahir tidak boleh kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6C6565),
                                ),
                                textAlign: TextAlign.left,
                                decoration: new InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                      color: Colors.black87,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    //Input Tanggal Lahir
                    EditProfileBornDate(),
                    //Dari Mana Anda Tau bill

                    //Button
                    BlocBuilder<SignUpProfileBloc, SignUpProfileState>(
                      builder: (context, state) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.2,
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.045,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF8b8484)),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () async {
                              _formKey.currentState!.validate();

                              if (_formKey.currentState!.validate()) {
                                String _phoneNumber = context
                                    .read<SignInPhoneNumberBloc>()
                                    .state
                                    .phoneNumber;
                                String _pinNumber = context
                                    .read<SignUpPinBloc>()
                                    .state
                                    .pinNumber;
                                context.read<SignUpProfileBloc>().add(
                                      FromSubmitted(
                                        phoneNumber: _phoneNumber,
                                        password: _pinNumber,
                                      ),
                                    );
                              }
                            },
                            color: Color(0xFF0B8CAD),
                            child: state.formStatus is FormSubmitting
                                ? CircularProgressIndicator()
                                : Text(
                                    'Simpan',
                                    style: TextStyle(
                                      color: Color(0xFFF4F7F8),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
