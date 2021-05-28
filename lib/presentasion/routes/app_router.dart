import 'package:bill/presentasion/pages/auth/Screen/sign_in_phone_number/sign_in_phone_number_sreen.dart';
import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/sign_in_pin_screen.dart';
import 'package:bill/presentasion/pages/auth/Screen/sign_up_otp/sign_up_otp_screen.dart';
import 'package:bill/presentasion/pages/home/screen/home_screen.dart';
import 'package:bill/presentasion/pages/intro/intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SignInPhoneNumberScreen(),
        );
      case '/SignInPhoneNumberScreen':
        return CupertinoPageRoute(
          builder: (_) => SignInPhoneNumberScreen(),
        );
      case '/SignInPhoneNumberScreenWithAnimation':
        return navigatinWithFadeTransition(
          SignInPhoneNumberScreen(),
        );
      case '/HomeScreen':
        return navigatinWithFadeTransition(
          HomeScreen(),
        );
      case '/SignInPinScreen':
        return navigatinWithScaleTransition(
          SignInPinScreen(),
        );
      case '/SignUpGetOTP':
        return MaterialPageRoute(
          builder: (_) => SignUpOTPScreen(),
        );
      case '/Intro':
      default:
        return MaterialPageRoute(
          builder: (_) => Intro(),
        );
    }
  }

  PageRouteBuilder navigatinWithScaleTransition(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return widget;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 300),
    );
  }

  PageRouteBuilder navigatinWithFadeTransition(Widget widget) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return widget;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return ScaleTransition(
          alignment: Alignment.bottomCenter,
          scale: animation,
          child: child,
        );
      },
    );
  }
}
