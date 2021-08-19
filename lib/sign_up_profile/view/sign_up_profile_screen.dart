import 'dart:io';
import 'package:bill/global/widgets/slow_connection_dialog.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/sign_in_phone_number/bloc/sign_in_phone_number_bloc.dart';
import 'package:bill/sign_up_pin/bloc/sign_up_pin_bloc.dart';
import 'package:bill/sign_up_profile/bloc/sign_up_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpProfileScreen extends StatelessWidget {
  final tanggalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpProfileBloc, SignUpProfileState>(
      listenWhen: (prevState, state) {
        return prevState.formStatus == state.formStatus ? false : true;
      },
      listener: (context, state) {
        if (state.formStatus is SubmissionSuccess) {
          Navigator.of(context).pushNamed('/HomeScreen');
        } else if (state.formStatus is SubmissionFailed) {
        } else if (state.formStatus is SubmissionError) {
          showDialog(
            context: context,
            builder: (context) {
              return SlowConnectionDialog();
            },
          );
        }
      },
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
                    //Header
                    SignUpProfileHeader(),
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
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(13),
                                ],
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
                    SignUpProfileBornDate(),
                    //Dari Mana Anda Tau bill
                    SignUpProfileKnowUsFrom(),
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

class SignUpProfileBornDate extends StatefulWidget {
  @override
  _SignUpProfileBornDateState createState() => _SignUpProfileBornDateState();
}

class _SignUpProfileBornDateState extends State<SignUpProfileBornDate> {
  final tanggalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            'Tanggal Lahir',
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
          child: GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1900),
                maxTime: DateTime(2100),
                onConfirm: (date) {
                  var picked = DateFormat('dd / MMMM / yyyy').format(date);
                  tanggalController.text = picked;
                  context.read<SignUpProfileBloc>().add(
                        BornDateFormChanged(date),
                      );
                },
              );
            },
            child: AbsorbPointer(
              child: BlocBuilder<SignUpProfileBloc, SignUpProfileState>(
                builder: (context, state) {
                  return TextFormField(
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == '') {
                        return 'Masukan Tanggal Lahir';
                      }
                      return null;
                    },
                    controller: tanggalController,
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
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpProfileKnowUsFrom extends StatelessWidget {
  final String trackValue = 'Dari mana anda tau Bill ?';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpProfileBloc, SignUpProfileState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.045,
            MediaQuery.of(context).size.width * 0.045,
            MediaQuery.of(context).size.width * 0.045,
            MediaQuery.of(context).size.width * 0.00,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: state.knowUsFrom,
              onChanged: (text) {
                context.read<SignUpProfileBloc>().add(
                      KnowUsFromChanged(text!),
                    );
              },
              items: <String>[
                'Dari mana anda tau Bill ?',
                'Email',
                'Teman',
                'Website',
                'Social Media',
                'Lainnya'
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}

class SignUpProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: FittedBox(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFF4F7F8),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                child: FittedBox(
                  child: Text(
                    'Profil',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF4F7F8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
