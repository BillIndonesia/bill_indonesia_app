import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:bill/packages/user/repository/auth_repository.dart';

import '../../main_screen/cubit/user_cubit.dart';
import '../../packages/user/repository/user_repository.dart';
import '../../sign_in_phone_number/bloc/sign_in_phone_number_bloc.dart';
import '../../sign_in_pin/bloc/sign_in_pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_auth_cubit.dart';
import 'material_app.dart';

class AppBlocProvider extends StatelessWidget {
  AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserAuthCubit(),
        ),
        BlocProvider(
          create: (context) => SignInPhoneNumberBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SignInPinBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => UserCubit(UserRepository()),
        ),
        BlocProvider(
          create: (context) => QrScannedBloc(),
        ),
      ],
      child: App(),
    );
  }
}
