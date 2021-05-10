import 'package:bill/presentasion/widgets/AuthButtonStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SigninPhoneNumberPage extends StatelessWidget {
  final phoneNUmberpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgpolos.png'),
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
              child: _loginForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm(context) {
    return Column(
      children: [
        header(context),
        formTextField(context),
        AuthButtonStyle(
          title: 'Masuk',
        ),
      ],
    );
  }

  Padding formTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width * 0.15,
        right: MediaQuery.of(context).size.width * 0.15,
      ),
      child: Form(
        key: _formKey,
        child: TextFormField(
          onChanged: (text) {
            // if (!isInitial && _formKey.currentState!.validate()) {
            //   return;
            // }
          },
          controller: phoneNUmberpController,
          inputFormatters: [LengthLimitingTextInputFormatter(13)],
          keyboardType: TextInputType.phone,
          style: TextStyle(
            color: Color(0xFF93CCDA),
            fontSize: 28.0,
            fontFamily: 'Montserrat',
          ),
          textAlign: TextAlign.center,
          showCursor: false,
          autofocus: false,
          // decoration: _formDecoration,
          validator: (value) {
            if (value != null) {
              const String pattern = r'^(?:[0][8])[0-9]{7,11}$';
              RegExp regExp = new RegExp(pattern);
              if (!regExp.hasMatch(value)) {
                return 'Masukkan nomor telepon yang valid';
              }
            }

            return null;
          },
        ),
      ),
    );
  }

  Container header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: FittedBox(
        child: Text(
          'Masukan Nomor Telepon anda',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
