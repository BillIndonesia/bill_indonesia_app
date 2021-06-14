import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final pageList = [
  PageModel(
    color: const Color(0xFF00A5DF),
    icon: const Icon(
      Icons.ac_unit,
      color: Colors.transparent,
    ),
    heroImagePath: 'assets/images/billslide1.png',
    heroImageColor: Colors.transparent,
    title: Image.asset(
      'assets/images/slide1.png',
    ),
    body: const Text(''),
  ),
  PageModel(
    color: const Color(0xFFFDB724),
    icon: const Icon(
      Icons.ac_unit,
      color: Colors.transparent,
    ),
    heroImagePath: 'assets/images/billslide1.png',
    heroImageColor: Colors.transparent,
    title: Image.asset(
      'assets/images/slide2.png',
    ),
    body: const Text(''),
  ),
  PageModel(
    color: const Color(0xFF8EBB5C),
    icon: const Icon(
      Icons.ac_unit,
      color: Colors.transparent,
    ),
    heroImagePath: 'assets/images/billslide1.png',
    title: Image.asset(
      'assets/images/slide3.png',
    ),
    heroImageColor: Colors.transparent,
    body: const Text(''),
  ),
  PageModel(
    color: const Color(0xFFBE5A5A),
    icon: const Icon(
      Icons.ac_unit,
      color: Colors.transparent,
    ),
    heroImagePath: 'assets/images/billslide1.png',
    heroImageColor: Colors.transparent,
    title: Image.asset(
      'assets/images/slide4.png',
    ),
    body: const Text(''),
  ),
];

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          FancyOnBoarding(
            doneButtonText: 'Done',
            skipButtonText: 'Skip',
            pageList: pageList,
            bottomMargin: 30,
            onDoneButtonPressed: () => Navigator.of(context).pushNamed(
              '/SignInPhoneNumberScreen',
            ),
            onSkipButtonPressed: () => Navigator.of(context).pushNamed(
              '/SignInPhoneNumberScreen',
            ),
            doneButton: MaterialButton(
              onPressed: () => Navigator.of(context).pushNamed(
                '/SignInPhoneNumberScreen',
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: FittedBox(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            color: Colors.transparent,
            child: Image.asset(
              'assets/images/textbill.png',
            ),
          ),
        ],
      ),
    );
  }
}
