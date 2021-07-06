import 'dart:io';

import 'package:bill/history/view/posts_screen.dart';
import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:bill/main_screen/view/main_screen.dart';
import 'package:bill/main_screen/view/widgets/main_screen_widgets.dart';
import 'package:bill/profile/view/profile_page.dart';

import 'package:flutter/services.dart';

import '../../packages/user/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _homeChild = MainScreen();
  int _pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    return BlocProvider(
      create: (context) => UserCubit(UserRepository())..fetchInitialData(),
      child: WillPopScope(
        onWillPop: () async {
          showDialog(
            context: context,
            builder: (_) {
              return ExitDialog(
                onTapYes: () => exit(0),
              );
            },
          );
          return false;
        },
        child: Scaffold(
          body: _homeChild,
          bottomNavigationBar: BlocBuilder<UserCubit, UserState>(
            builder: (_, state) {
              return BottomNavigationBar(
                onTap: (index) {
                  print(state.loadingStatus);
                  if (state.loadingStatus == UserLoadingStatus.success) {
                    if (index == 0) {
                      setState(
                        () {
                          _pageIndex = 0;
                          _homeChild = HistoryScreen();
                        },
                      );
                    }
                    if (index == 1) {
                      setState(
                        () {
                          _pageIndex = 1;
                          _homeChild = MainScreen();
                        },
                      );
                    }
                    if (index == 2) {
                      setState(
                        () {
                          _pageIndex = 2;
                          _homeChild = ProfileScreen();
                        },
                      );
                    }
                  }
                },
                // unselectedLabelStyle: TextStyle(color: Colors.black),
                // selectedLabelStyle: TextStyle(color: Colors.blue.shade400),
                currentIndex: _pageIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(
                      Icons.history,
                      color:
                          _pageIndex == 0 ? Colors.blue.shade400 : Colors.black,
                    ),
                    label: 'Riwayat',
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(
                      Icons.home,
                      color:
                          _pageIndex == 1 ? Colors.blue.shade400 : Colors.black,
                    ),
                    label: 'Home',
                    backgroundColor:
                        _pageIndex == 1 ? Colors.blue.shade400 : Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
