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
      child: EditProfileScreenStatus(),
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
        return MainScreenLoading();
      case UserLoadingStatus.success:
        return EditProfileScreenContent();
      case UserLoadingStatus.failure:
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SlowConnectionDialog(),
        );
    }
  }
}
