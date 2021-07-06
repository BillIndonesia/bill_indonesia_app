import 'package:bill/global/widgets/slow_connection_dialog.dart';
import 'package:bill/home_page/cubit/user_cubit.dart';

import 'package:bill/main_screen/view/widgets/main_screen_widgets.dart';
import 'package:bill/packages/camera/view/home_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
            ),
          ),
          child: Container(
            child: Image.asset(
              'assets/images/textbill.png',
            ),
          ),
        ),
        MainScreenStatus(),
      ],
    );
  }
}

class MainScreenStatus extends StatelessWidget {
  MainScreenStatus({Key? key}) : super(key: key);
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
        return MainScreenContent();
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

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.4,
          //   child: Placeholder(),
          // ),
          HomeCamera(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserProfileCard(),
              UserBalanceCard(),
            ],
          ),
          UserQRCode(),
        ],
      ),
    );
  }
}

class MainScreenLoading extends StatelessWidget {
  const MainScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.43,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.007),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: true,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: true,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.width * 0.007,
              ),
              width: MediaQuery.of(context).size.width * 0.68,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset('assets/images/bingkai.png'),
            ),
          ),
        ],
      ),
    );
  }
}
