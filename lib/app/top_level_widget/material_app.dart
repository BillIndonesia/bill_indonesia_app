import '../app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Bill',
      onGenerateRoute: _appRouter.onGeneratedRoute,
      home: BlocProvider(
        create: (context) => UserAuthCubit()..fetchInitialData(),
        child: const SplashScreen(),
      ),
    );
  }
}
