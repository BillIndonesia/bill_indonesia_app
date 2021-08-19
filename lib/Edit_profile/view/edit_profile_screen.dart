import 'package:bill/Edit_profile/view/widgets/edit_profile_widgets.dart';
import 'package:bill/global/widgets/slow_connection_dialog.dart';

import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:bill/main_screen/view/main_screen.dart';
import 'package:bill/packages/user/repository/user_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_profile_screen_content.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(UserRepository())..fetchInitialData(),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/HomeScreen',
            (Route<dynamic> route) => false,
          );
          return true;
        },
        child: Scaffold(
          body: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: EditProfileScreenStatus(),
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfileScreenStatus extends StatelessWidget {
  EditProfileScreenStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (UserCubit cubit) => cubit.state.loadingStatus,
    );

    switch (status) {
      case UserLoadingStatus.initial:
        return MainScreenLoading();
      case UserLoadingStatus.loading:
        return EditProfileLoading();
      case UserLoadingStatus.success:
        return EditProfileScreenContent();
      case UserLoadingStatus.failure:
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlowConnectionDialog(),
              MaterialButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: FittedBox(
                    child: Text(
                      'Coba Lagi',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B8CAD),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<UserCubit>().fetchInitialData();
                },
              ),
            ],
          ),
        );
    }
  }
}
