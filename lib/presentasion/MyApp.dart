import 'package:bill/application/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:bill/application/auth/sign_in_pin_bloc/sign_in_pin_bloc.dart';
import 'package:bill/application/auth/sign_up_bloc/sign_up_bloc.dart';
import 'package:bill/application/auth/user_bloc/user_bloc.dart';
import 'package:bill/data/data_providers/auth/auth_repository.dart';

import 'package:bill/presentasion/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(authRepo: AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SignInPinBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
            AuthRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bill',
        onGenerateRoute: _appRouter.onGeneratedRoute,
      ),
    );
  }
}
