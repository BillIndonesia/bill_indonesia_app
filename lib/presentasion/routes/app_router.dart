import 'package:bill/presentasion/pages/auth/Screen/sign_in_phone_number/sign_in_phone_number_sreen.dart';
import 'package:bill/presentasion/pages/auth/Screen/sign_in_pin/sign_in_pin_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SignInPinScreen(),
        );
      case '/SignInPinScreen':
        return MaterialPageRoute(
          builder: (_) => SignInPinScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => SignInPhoneNumberScreen(),
        );
    }
  }

  void dispose() {}
}
