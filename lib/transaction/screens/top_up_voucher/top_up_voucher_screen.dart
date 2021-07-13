import 'package:bill/home_page/view/home_screen.dart';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TopUpVoucher extends StatelessWidget {
  const TopUpVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (QrScannedBloc bloc) => bloc.state.transactionStatus,
    );
    final bool isSucces = status == TransactionStatus.success;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/HomeScreen',
          (Route<dynamic> route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF4F7F8),
        body: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Picture
              Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.35,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Image(
                  image: isSucces
                      ? AssetImage('assets/images/berhasil.png')
                      : AssetImage(
                          'assets/images/gagal.png',
                        ),
                ),
              ),
              //Teks Header
              isSucces
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FittedBox(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF999494),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat'),
                            children: <TextSpan>[
                              new TextSpan(
                                text: 'Anda Berhasil menerima Top Up\n',
                              ),
                              new TextSpan(
                                text: 'Sebesar Rp 10.000',
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      // color: Colors.green,
                      child: FittedBox(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF999494),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat'),
                            children: <TextSpan>[
                              new TextSpan(text: 'Top Up gagal dilakukan\n'),
                              new TextSpan(
                                  text: 'Karena voucher sudah tidak berlaku\n'),
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              //Button
              Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                child: MaterialButton(
                  onPressed: () {
                    print('pressed');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  color: Color(0xFF0B8CAD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        isSucces ? 'Oke' : 'Kembali',
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFF4F7F8),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
