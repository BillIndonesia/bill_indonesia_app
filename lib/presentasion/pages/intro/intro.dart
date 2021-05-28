import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

final pageList = [
  PageModel(
    color: const Color(0xFF00A5DF),
    icon: Icon(
      Icons.ac_unit,
    ),
    heroImagePath: '',
    title: Image.asset(
      'images/slide1.png',
    ),
    body: Text(''),
  ),
  PageModel(
    color: const Color(0xFFFDB724),
    icon: Icon(
      Icons.ac_unit,
    ),
    heroImagePath: '',
    title: Image.asset(
      'images/slide2.png',
    ),
    body: Text(''),
  ),
  PageModel(
    color: const Color(0xFF8EBB5C),
    icon: Icon(
      Icons.ac_unit,
    ),
    heroImagePath: '',
    title: Image.asset(
      'images/slide3.png',
    ),
    body: Text(''),
  ),
  PageModel(
    color: const Color(0xFFBE5A5A),
    icon: Icon(
      Icons.ac_unit,
    ),
    heroImagePath: '',
    title: Image.asset(
      'images/slide4.png',
    ),
    body: Text(''),
  ),
];

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FancyOnBoarding(
            doneButtonText: "Done",
            skipButtonText: "Skip",
            pageList: pageList,
            bottomMargin: 50,
            onDoneButtonPressed: () => Navigator.of(context).pushNamed(
              '/SignInPhoneNumberScreen',
            ),
            onSkipButtonPressed: () => Navigator.of(context).pushNamed(
              '/SignInPhoneNumberScreen',
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            color: Colors.transparent,
            child: Container(
              child: Image.asset(
                'images/textbill.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
