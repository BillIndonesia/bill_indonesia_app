import 'package:flutter/material.dart';

class SaldoButton extends StatefulWidget {
  const SaldoButton({Key? key}) : super(key: key);

  @override
  _SaldoButtonState createState() => _SaldoButtonState();
}

class _SaldoButtonState extends State<SaldoButton> {
  bool topup = false;
  bool pembayaran = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 1.0,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.13,
          // color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Saldo',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF423838),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: topup == false
                              ? Color(0xFF8b8484)
                              : Color(0xFF2C81B7)),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.063,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        if (topup == true) {
                          setState(() {
                            topup = false;
                          });
                        } else {
                          setState(
                            () {
                              topup = true;
                            },
                          );
                        }
                      },
                      color: Color(0xFFF4F7F8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          topup == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.015),
                                  child: Icon(
                                    Icons.check,
                                    color: Color(0xFF2C81B7),
                                  ),
                                )
                              : Container(),
                          Text(
                            'Top Up',
                            style: TextStyle(
                              color: topup == false
                                  ? Color(0xFF000000)
                                  : Color(0xFF2C81B7),
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: pembayaran == false
                            ? Color(0xFF8b8484)
                            : Color(0xFF2C81B7),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.063,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        if (pembayaran == true) {
                          setState(() {
                            pembayaran = false;
                          });
                        } else {
                          setState(() {
                            pembayaran = true;
                          });
                        }
                      },
                      color: Color(0xFFF4F7F8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          pembayaran == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.002),
                                  child: Icon(
                                    Icons.check,
                                    color: Color(
                                      0xFF2C81B7,
                                    ),
                                  ),
                                )
                              : Container(),
                          Text(
                            'Pembayaran',
                            style: TextStyle(
                              color: pembayaran == false
                                  ? Color(0xFF000000)
                                  : Color(0xFF2C81B7),
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
