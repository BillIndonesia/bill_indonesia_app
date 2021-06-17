import 'package:bill/Edit_profile/view/edit_profile_screen.dart';
import 'package:bill/about/about_screen.dart';
import 'package:bill/help/view/help_screen.dart';
import 'package:bill/history/view/posts_screen.dart';
import 'package:bill/sign_up_otp/sign_up_otp_screen.dart';
import 'package:bill/sign_up_pin/bloc/sign_up_confirmation_pin_screen.dart';
import 'package:bill/sign_up_pin/bloc/sign_up_pin_screen.dart';
import 'package:bill/sign_up_profile/view/sign_up_profile_screen.dart';
import 'package:bill/term_and_condition/term_and_condition.dart';
import 'package:bill/transaction/screens/top_up_voucher/top_up_voucher_screen.dart';

import '../../home_page/view/home_screen.dart';
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
          builder: (_) => OtpScreen(),
        );
      case '/SignUpPinScreen':
        return CupertinoPageRoute(
          builder: (_) => SignUpPinScreen(),
        );
      case '/SignUpConfirmationPinScreen':
        return CupertinoPageRoute(
          builder: (_) => SignUpConfimationPin(),
        );
      case '/SignUpProfileScreen':
        return CupertinoPageRoute(
          builder: (_) => SignUpProfileScreen(),
        );
      case '/HomeScreen':
        return CupertinoPageRoute(
          builder: (_) => HomePage(),
        );
      case '/HistoryScreen':
        return CupertinoPageRoute(
          builder: (_) => HistoryScreen(),
        );
      case '/TermConditionScreen':
        return CupertinoPageRoute(
          builder: (_) => TermCondition(),
        );
      case '/AboutScreen':
        return CupertinoPageRoute(
          builder: (_) => AboutScreen(),
        );
      case '/EditProfileScreen':
        return CupertinoPageRoute(
          builder: (_) => EditProfileScreen(),
        );
      case '/HelpScreen':
        return CupertinoPageRoute(
          builder: (_) => HelpScreen(),
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
