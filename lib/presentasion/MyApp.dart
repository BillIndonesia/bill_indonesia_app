import 'package:bill/application/auth/bloc/sign_in_bloc.dart';
import 'package:bill/application/sign_in/auth_repository.dart';

import 'package:bill/presentasion/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(authRepo: AuthRepository()),
          child: Container(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bill',
        onGenerateRoute: AppRouter().onGeneratedRoute,
      ),
    );
  }
}
