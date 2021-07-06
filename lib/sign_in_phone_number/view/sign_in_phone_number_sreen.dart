import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/Sign_in_Phone_number_term_and_condition_checkbox.dart';
import 'widgets/sign_in_phone_number_button.dart';
import 'widgets/sign_in_phone_number_header.dart';
import 'widgets/sign_in_phone_number_text_form_field.dart';

class SignInPhoneNumberScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent),
    );
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgpolos.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22,
              ),
              child: Column(
                children: [
                  SigninPhoneNumberHeader(
                    header: 'Nomor Telepon',
                  ),
                  //PhoneNumber Form Field
                  SignInPhoneNumberTextFormField(formKey: _formKey),
                  //Term & Condition
                  SignInPhoneNumberTermAndConditionCheckBoxAndText(),
                  // Submit Button
                  SignInPhoneNumberButton(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
