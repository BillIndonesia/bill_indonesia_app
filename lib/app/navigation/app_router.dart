import 'package:bill/sign_up_otp/view/sign_up_otp_screen.dart';
import 'package:bill/transaction/screens/top_up_voucher/top_up_voucher_screen.dart';

import '../../main_screen/view/home_screen.dart';
import '../../sign_in_phone_number/view/sign_in_phone_number_sreen.dart';
import '../../sign_in_pin/view/sign_in_pin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../top_level_widget/splash_screen.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/SignInPhoneNumberScreen':
        return CupertinoPageRoute(
          builder: (_) => SignInPhoneNumberScreen(),
        );
      case '/SignInPinScreen':
        return CupertinoPageRoute(
          builder: (_) => SignInPinScreen(),
        );
      case '/SignUpOtpScreen':
        return CupertinoPageRoute(
          builder: (_) => SignUpOtpScreen(),
        );
      case '/HomeScreen':
        return CupertinoPageRoute(
          builder: (_) => HomeScreen(),
        );
      //transaction
      case '/TopUpVoucherScreen':
        return CupertinoPageRoute(
          builder: (_) => TopUpVoucher(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
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
          position: Tween<Offset>(
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
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  PageRouteBuilder navigatinWithFadeTransition(Widget widget) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
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
