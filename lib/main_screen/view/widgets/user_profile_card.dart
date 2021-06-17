import 'dart:convert';
import 'dart:typed_data';
import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userName = context.watch<UserCubit>().state.data.name;
    final String image = context.watch<UserCubit>().state.data.image;
    Uint8List bytes = base64.decode(image);
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.007,
      ),
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 8.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF0485AC),
                    Color(0xFF36B8B6),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      width: MediaQuery.of(context).size.width * 0.08,
                      height: MediaQuery.of(context).size.width * 0.08,
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
                                    MediaQuery.of(context).size.width * 0.035,
                                child: FittedBox(
                                  child: Text(
                                    userName != '' ? userName[0] : '',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFFF4F7F8),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Halo,',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              // fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFF4F7F8),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            userName.split(' ')[0],
                            style: TextStyle(
                              // fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF4F7F8),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
