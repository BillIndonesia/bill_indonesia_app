import 'package:bill/sign_up_profile/bloc/sign_up_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class EditProfileBornDate extends StatefulWidget {
  @override
  _EditProfileBornDateState createState() => _EditProfileBornDateState();
}

class _EditProfileBornDateState extends State<EditProfileBornDate> {
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
