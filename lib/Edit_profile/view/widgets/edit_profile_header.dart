import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bill/home_page/cubit/user_cubit.dart';

class EditProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _image = context.watch<UserCubit>().state.data.image;
    final String _name = context.watch<UserCubit>().state.data.name;
    final String _phoneNumber =
        context.watch<UserCubit>().state.data.phoneNumber;
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          //AppBar
          Row(
            children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: FittedBox(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFF4F7F8),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/HomeScreen',
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                child: FittedBox(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF4F7F8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Profile
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                //photos
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Photo
                      _userPhoto(context, _image, _name),
                      //Name
                      _userName(context, _name),
                      //phone Number
                      __userPhoneNumber(context, _phoneNumber),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget __userPhoneNumber(BuildContext context, String _phoneNumber) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      // width: MediaQuery.of(context).size.width * 0.25,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.02,
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          _phoneNumber,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color(0xFFF4F7F8),
          ),
        ),
      ),
    );
  }

  Widget _userName(BuildContext context, String _name) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.02,
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          _name,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color(0xFFF4F7F8),
          ),
        ),
      ),
    );
  }

  Widget _userPhoto(BuildContext context, String image, String _name) {
    Uint8List bytes = base64.decode(image);
    return Container(
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
                  width: MediaQuery.of(context).size.width * 0.06,
                  // color: Colors.red,
                  child: FittedBox(
                    child: Text(
                      _name[0],
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
    );
  }
}
