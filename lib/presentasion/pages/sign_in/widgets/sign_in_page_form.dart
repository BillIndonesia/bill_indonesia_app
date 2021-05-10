import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bill/application/sign_in/sign_in_provider.dart';
import 'package:bill/presentasion/pages/sign_in/widgets/sign_in_form_Decoration.dart';
import 'package:bill/presentasion/widgets/AuthButtonStyle.dart';
import 'package:bill/presentasion/widgets/loading_progress_indicator.dart';

part 'package:bill/presentasion/pages/sign_in/widgets/sign_in_phone_number_event.dart/sign_in_phone_number_event.dart';

class SigninPhoneNumberForm extends StatefulWidget {
  SigninPhoneNumberForm({Key? key}) : super(key: key);

  @override
  _SigninPhoneNumberFormState createState() => _SigninPhoneNumberFormState();
}

class _SigninPhoneNumberFormState extends State<SigninPhoneNumberForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final phoneNUmberpController = TextEditingController();
  final _formDecoration =
      SigninFormDecoration().signinPhoneNumberFormDecoration();
  bool hasError = false;
  bool isChecked = false;
  bool isInitial = true;
  bool isLoading = false;

  @override
  void dispose() {
    formTextField();
    _submit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          new FocusNode(),
        );
      },
      child: Column(
        children: [
          formTextField(),
          termAndCondition(context),
          lanjutButton(),
        ],
      ),
    );
  }

  Visibility lanjutButton() {
    return Visibility(
      visible: isChecked,
      child: isLoading
          ? LoadingProgressIndicator()
          : GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _submit();
                }
              },
              child: AuthButtonStyle(
                title: 'Masuk',
              ),
            ),
    );
  }

  Container termAndCondition(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            activeColor: Color(0XFF0485AC),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Expanded(
            child: Container(
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: 'Setuju dengan '),
                      new TextSpan(
                        text: 'Ketentuan Layanan ',
                        style:
                            new TextStyle(decoration: TextDecoration.underline),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.of(context).push(
                            //   new MaterialPageRoute(
                            //     builder: (context) =>
                            //         new TermCondition(),
                            //   ),
                            // );
                          },
                      ),
                      new TextSpan(text: 'dan '),
                      new TextSpan(
                        text: 'Kebijakan Privasi',
                        style: new TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.of(context).push(
                            //   new MaterialPageRoute(
                            //     builder: (context) =>
                            //         new TermCondiction(),
                            //   ),
                            // );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding formTextField() {
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
            if (!isInitial && _formKey.currentState!.validate()) {
              return;
            }
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
          decoration: _formDecoration,
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

  void _submit() async {
    setState(
      () {
        isLoading = true;
      },
    );
    var _submit = await Provider.of<SigninProvider>(
      context,
      listen: false,
    ).signinPhoneNumber(phoneNUmberpController.text);
    setState(
      () {
        isInitial = false;
        isLoading = false;
      },
    );
  }
}
