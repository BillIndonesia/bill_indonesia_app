import 'package:bill/main_screen/view/widgets/exit_dialog.dart';
import 'package:bill/main_screen/view/widgets/user_balance_card.dart';
import 'package:bill/main_screen/view/widgets/user_qr_code.dart';

import '../cubit/user_cubit.dart';
import '../../packages/user/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/user_profile_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (_) {
            return ExitDialog();
          },
        );
        return false;
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => UserCubit(UserRepository())..fetchInitialData(),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: new BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
                )),
                child: Container(
                  child: Image.asset(
                    'assets/images/textbill.png',
                  ),
                ),
              ),
              const MainScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
        return Center(
          child: const Dialog(
            child: Text('Error'),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Placeholder(),
          ),
          // HomeCamera(),
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
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset('assets/images/bingkai.png'),
            ),
          ),
        ],
      ),
    );
  }
}
