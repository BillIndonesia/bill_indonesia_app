import 'dart:convert';
import 'dart:typed_data';
import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bill/main_screen/view/widgets/main_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String image = context.watch<UserCubit>().state.data.image;
    final String nama = context.watch<UserCubit>().state.data.name;
    final String nohp = context.watch<UserCubit>().state.data.phoneNumber;

    Uint8List bytes = base64.decode(image);
    return Scaffold(
      body: Stack(
        children: [
          //background
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/banner.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          //content
          Column(
            children: [
              //header
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    //User Info
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Photo
                          Container(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
                              decoration: image != ''
                                  ? BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: MemoryImage(bytes),
                                      ),
                                    )
                                  : BoxDecoration(shape: BoxShape.circle),
                              child: image == ''
                                  ? CircleAvatar(
                                      backgroundColor: Color(0xFF0485AC),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text(
                                            nama[0],
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFFF4F7F8),
                                              fontSize: 40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          //Name
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                nama,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color(0xFFF4F7F8),
                                ),
                              ),
                            ),
                          ),
                          //phone Number
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            // width: MediaQuery.of(context).size.width * 0.25,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.02),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                nohp,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color(0xFFF4F7F8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //info Card
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: _cardItem(
                          context: context,
                          title: 'Bantuan',
                          assetsPath: 'assets/images/bantuan.png',
                          navigatorPath: '/HelpScreen',
                        ),
                      ),
                      Expanded(
                        child: _cardItem(
                          context: context,
                          title: 'Ketentuan Layanan',
                          assetsPath: 'assets/images/ketentuan.png',
                          navigatorPath: '/TermConditionScreen',
                        ),
                      ),
                      Expanded(
                        child: _cardItem(
                          context: context,
                          title: 'Kebijakan Privasi',
                          assetsPath: 'assets/images/kebijakan.png',
                          navigatorPath: '/TermConditionScreen',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //settings card
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: _cardItem(
                            context: context,
                            title: 'Edit Profile',
                            assetsPath: 'assets/images/profil.png',
                            navigatorPath: '/EditProfileScreen',
                          ),
                        ),
                        Expanded(
                          child: _cardItem(
                            context: context,
                            title: 'About',
                            assetsPath: 'assets/images/about.png',
                            navigatorPath: '/AboutScreen',
                          ),
                        ),
                        Expanded(
                          child: _cardItem(
                            context: context,
                            title: 'Keluar',
                            assetsPath: 'assets/images/keluar.png',
                            navigatorPath: '/TermConditionScreen',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _cardItem(
      {required BuildContext context,
      required String title,
      required String assetsPath,
      required String navigatorPath}) {
    return GestureDetector(
      onTap: () {
        title != 'Ganti akun'
            ? Navigator.of(context).pushNamed(navigatorPath)
            : showDialog(
                context: context,
                builder: (_) {
                  return ExitDialog(
                    onTapYes: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('nohp');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/SignInPhoneNumberScreen',
                        (Route<dynamic> route) => false,
                      );
                    },
                  );
                },
              );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        // alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFEBECEE),
              ),
            ),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03),
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                    child: Image.asset(
                      assetsPath,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF423838),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePageAppbar extends StatelessWidget {
  const ProfilePageAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Container(
          width: MediaQuery.of(context).size.width * 0.23,
          child: FittedBox(
            child: Text(
              'Akun Saya',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(
                  0xFFF4F7F8,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
