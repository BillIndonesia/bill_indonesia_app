import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileLoading extends StatelessWidget {
  const EditProfileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                          Navigator.of(context).pop();
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
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: true,
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: true,
                            child: Container(
                              // margin: EdgeInsets.only(
                              //   top: MediaQuery.of(context).size.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: true,
                            child: Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
