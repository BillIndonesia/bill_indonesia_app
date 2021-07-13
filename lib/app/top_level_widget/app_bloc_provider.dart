import 'package:bill/Edit_profile/bloc/edit_profile_bloc.dart';
import 'package:bill/help/model/bantuan_model.dart';
import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:bill/packages/camera/data/camera_repository.dart';
import 'package:bill/packages/user/repository/auth_repository.dart';
import 'package:bill/sign_up_otp/sign_up_bloc/sign_up_bloc.dart';
import 'package:bill/sign_up_pin/bloc/sign_up_pin_bloc.dart';
import 'package:bill/sign_up_profile/bloc/sign_up_profile_bloc.dart';
import 'package:provider/provider.dart';
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
          create: (context) => UserCubit(UserRepository()),
        ),
        BlocProvider(
          create: (context) => SignInPhoneNumberBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SignInPinBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => EditProfileBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SignUpPinBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpProfileBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => UserCubit(UserRepository()),
        ),
        BlocProvider(
          create: (context) => QrScannedBloc(
            cameraRepo: CameraRepository(),
          ),
        ),
      ],
      child: ChangeNotifierProvider.value(
        value: BantuanModel(),
        child: App(),
      ),
    );
  }
}
