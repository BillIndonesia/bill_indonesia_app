import 'package:bill/presentasion/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SigninPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => SigninPage(),
        );
    }
  }

  void dispose() {}
}
