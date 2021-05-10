import 'package:bill/application/sign_in/auth_repository.dart';
import 'package:bill/application/sign_in/bloc/bloc_view.dart';
import 'package:bill/application/sign_in/sign_in_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SigninProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bill',
        home: RepositoryProvider(
          create: (context) => AuthRepository(),
          child: LoginView(),
        ),
      ),
    );
  }
}
