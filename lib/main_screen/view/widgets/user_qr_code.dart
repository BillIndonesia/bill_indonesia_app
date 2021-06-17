import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserQRCode extends StatelessWidget {
  const UserQRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userPhoneNumber =
        context.watch<UserCubit>().state.data.phoneNumber;
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.68,
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.007,
          ),
          child: QrImage(
            gapless: false,
            data: userPhoneNumber,
            size: MediaQuery.of(context).size.width * 0.39,
            version: 3,
            // embeddedImage: AssetImage('assets/images/bill biru.png'),
            // embeddedImageStyle: QrEmbeddedImageStyle(
            //   size: Size(50, 50),
            //   color: Colors.black,
            // ),
            // foregroundColor: Color(0xFF0B8CAD),
          ),
        ),
        //Background Image
        Container(
          width: MediaQuery.of(context).size.width * 0.68,
          height: MediaQuery.of(context).size.height * 0.3,
          alignment: Alignment.center,
          child: Image(
            image: AssetImage(
              'assets/images/bingkai.png',
            ),
          ),
        ),
      ],
    );
  }
}
