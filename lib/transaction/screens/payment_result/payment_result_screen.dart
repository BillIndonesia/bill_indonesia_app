import 'package:bill/home_page/view/home_screen.dart';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'widgets/payment_result_widgets.dart';

class PaymentResultScreen extends StatelessWidget {
  const PaymentResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.read<QrScannedBloc>().state;
    var merchantData = context.read<QrScannedBloc>().state.transactionData;
    String merchantType = merchantData['merchant_type']['merchant_type_name'];
    var status = data.transactionStatus;
    return WillPopScope(
      onWillPop: () async {
        status == TransactionStatus.success && merchantType != 'warung'
            ? showDialog(
                context: context,
                builder: (context) {
                  return PaymentResultBackDialog();
                })
            : Navigator.of(context).pushReplacement(
                new MaterialPageRoute(
                  builder: (context) => new HomePage(),
                ),
              );
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF4F7F8),
        body: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _statusImage(context, status),
                    _statusText(context, status, merchantType),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    PaymentResultDestinationProfile(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.018,
                child: Visibility(
                  visible: status == TransactionStatus.success,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      merchantType == 'warung'
                          ? ''
                          : '*Tunjukan halaman ini kepada supir sebagai bukti pembayaran',
                      style: TextStyle(
                        fontFamily: 'monsetrat',
                        fontSize: 16,
                        color: Color(0xFF5A5B5C),
                      ),
                    ),
                  ),
                ),
              ),
              _button(context, status, merchantType),
            ],
          ),
        ),
      ),
    );
  }

  Container _button(BuildContext context, status, merchantType) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      child: MaterialButton(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.035,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              'Oke',
              style: new TextStyle(
                fontSize: 16.0,
                color: Color(0xFFF4F7F8),
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        color: Color(0xFF0B8CAD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          status == TransactionStatus.success && merchantType != 'warung'
              ? showDialog(
                  context: context,
                  builder: (context) {
                    return PaymentResultBackDialog();
                  })
              : Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                    builder: (context) => new HomePage(),
                  ),
                );
        },
      ),
    );
  }

  Container _statusText(BuildContext context, status, merchantType) {
    return status == TransactionStatus.success
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
                        text: 'Anda Berhasil membayar $merchantType jam\n'),
                    new TextSpan(
                      text: '${DateFormat('HH.mm').format(DateTime.now())}',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    new TextSpan(text: '\nkepada'),
                  ],
                ),
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: FittedBox(
              child: RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF999494),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Anda Gagal melakukan Pembayaran\n'),
                    new TextSpan(text: 'Karena Saldo anda tidak cukup')
                  ],
                ),
              ),
            ),
          );
  }

  Container _statusImage(BuildContext context, status) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Image(
        image: AssetImage(
          status == TransactionStatus.success
              ? 'assets/images/berhasil.png'
              : 'assets/images/gagal.png',
        ),
      ),
    );
  }
}
