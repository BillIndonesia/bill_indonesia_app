import '../app.dart';
import '../../intro/intro.dart';
import '../../main_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (UserAuthCubit cubit) => cubit.state.authStatus,
    );
    switch (status) {
      case AuthStatus.initial:
        return Scaffold(
          body: Image.asset(
            'assets/images/billnew.jpeg',
          ),
        );
      case AuthStatus.loading:
        return Scaffold(
          body: Image.asset(
            'assets/images/billnew.jpeg',
          ),
        );
      case AuthStatus.success:
        return const Intro();
      case AuthStatus.failure:
        return HomeScreen();
    }
  }
}
