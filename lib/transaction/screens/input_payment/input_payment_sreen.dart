import 'dart:convert';
import 'dart:typed_data';

import 'package:bill/home_page/view/home_screen.dart';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/transaction/screens/payment_result/payment_result_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/input_payment_widgets.dart';

class InputPaymentScreen extends StatefulWidget {
  const InputPaymentScreen({Key? key}) : super(key: key);

  @override
  _InputPaymentScreenState createState() => _InputPaymentScreenState();
}

class _InputPaymentScreenState extends State<InputPaymentScreen> {
  final jumlahController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var data = context.read<QrScannedBloc>().state.transactionData;
    Uint8List bytes;
    bytes = base64.decode(data['merchant_image']);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/HomeScreen',
          (Route<dynamic> route) => false,
        );
        return false;
      },
      child: BlocConsumer<QrScannedBloc, QrScannedState>(
        listenWhen: (prevState, state) {
          return prevState.formStatus != state.formStatus;
        },
        listener: (context, state) {
          if (state.formStatus is FormSubmitting) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.005,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white10),
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Harap tunggu'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state.formStatus is SubmissionSuccess) {
            Navigator.of(context).pushReplacement(
              new MaterialPageRoute(
                builder: (context) => new PaymentResultScreen(),
              ),
            );
          }
          if (state.formStatus is SubmissionError) {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    alignment: Alignment.center,
                    child: Text(
                      'Periksa koneksi internet anda',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(
                          0xFF423838,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Container(
                width: MediaQuery.of(context).size.width * 0.43,
                child: FittedBox(
                  child: Text(
                    'Pembayaran Angkot',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xFF423838,
                      ),
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon:
                    Icon(Icons.arrow_back, color: Color(0xFF777E81), size: 30),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => new HomePage(),
                    ),
                  );
                },
              ),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0,
            ),
            body: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Header
                  Row(
                    children: [
                      //destination profile
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Card(
                          color: Color(0xFFE4F2FB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            child: _destinationProfile(context, bytes, data),
                          ),
                        ),
                      ),
                      //nominal output
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                        ),
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.01,
                          bottom: MediaQuery.of(context).size.height * 0.01,
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: FittedBox(
                                child: Text(
                                  'Anda Akan membayar sebesar',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13,
                                    color: Color(0xFF999494),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: TextFormField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  controller: jumlahController,
                                  style: TextStyle(
                                    color: Color(0xFF6c6565),
                                    fontSize: 24.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    suffix: IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        setState(
                                          () {
                                            jumlahController.text = '';
                                          },
                                        );
                                      },
                                    ),
                                    hintText: 'Rp 0',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF6c6565),
                                      fontSize: 24.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //nominal button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //Nominal button 2000 - 4000
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Button 2.000
                            GestureDetector(
                              child: nominalButtonTemplate(
                                context,
                                'assets/images/10.png',
                                '2.000',
                              ),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        2000)
                                    .toString();
                                MoneyFormatterOutput fo = MoneyFormatter(
                                  amount: double.parse(sementara),
                                  settings: MoneyFormatterSettings(
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                  ),
                                ).output;
                                setState(
                                  () {
                                    jumlahController.text =
                                        fo.withoutFractionDigits.toString();
                                  },
                                );
                              },
                            ),
                            //Button 3.000
                            GestureDetector(
                              child: nominalButtonTemplate(
                                context,
                                'assets/images/10.png',
                                '3.000',
                              ),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        3000)
                                    .toString();
                                MoneyFormatterOutput fo = MoneyFormatter(
                                  amount: double.parse(sementara),
                                  settings: MoneyFormatterSettings(
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                  ),
                                ).output;
                                setState(
                                  () {
                                    jumlahController.text =
                                        fo.withoutFractionDigits.toString();
                                  },
                                );
                              },
                            ),
                            //button 4.000
                            GestureDetector(
                              child: nominalButtonTemplate(
                                context,
                                'assets/images/30.png',
                                '4.000',
                              ),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        4000)
                                    .toString();
                                MoneyFormatterOutput fo = MoneyFormatter(
                                  amount: double.parse(sementara),
                                  settings: MoneyFormatterSettings(
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                  ),
                                ).output;
                                setState(
                                  () {
                                    jumlahController.text =
                                        fo.withoutFractionDigits.toString();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      //Nominal Button 3000 - 7000
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Button 5.000
                            GestureDetector(
                              child: nominalButtonTemplate(
                                context,
                                'assets/images/50.png',
                                '5.000',
                              ),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        5000)
                                    .toString();
                                MoneyFormatterOutput fo = MoneyFormatter(
                                  amount: double.parse(sementara),
                                  settings: MoneyFormatterSettings(
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                  ),
                                ).output;
                                setState(
                                  () {
                                    jumlahController.text =
                                        fo.withoutFractionDigits.toString();
                                  },
                                );
                              },
                            ),
                            //Button 6.000
                            GestureDetector(
                              child: nominalButtonTemplate(
                                context,
                                'assets/images/100.png',
                                '6.000',
                              ),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        6000)
                                    .toString();
                                MoneyFormatterOutput fo = MoneyFormatter(
                                  amount: double.parse(sementara),
                                  settings: MoneyFormatterSettings(
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                  ),
                                ).output;
                                setState(
                                  () {
                                    jumlahController.text =
                                        fo.withoutFractionDigits.toString();
                                  },
                                );
                              },
                            ),
                            //button 7.000
                            GestureDetector(
                              child: nominalButtonTemplate(
                                context,
                                'assets/images/100.png',
                                '7.000',
                              ),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        7000)
                                    .toString();
                                MoneyFormatterOutput fo = MoneyFormatter(
                                  amount: double.parse(sementara),
                                  settings: MoneyFormatterSettings(
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                  ),
                                ).output;
                                setState(
                                  () {
                                    jumlahController.text =
                                        fo.withoutFractionDigits.toString();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // procces button
                  jumlahController.text != '' &&
                          (int.parse(jumlahController.text
                                      .replaceAll('.', '')) +
                                  1) !=
                              1
                      ? Visibility(
                          visible: (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      1) !=
                                  1
                              ? true
                              : false,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //Cancel Button
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF0B8CAD),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Color(0xFF0B8CAD),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: FittedBox(
                                        child: Text(
                                          'Batal',
                                          style: TextStyle(
                                            color: Color(0xFFF4F7F8),
                                            fontFamily: 'Montserrat',
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(
                                          builder: (context) => new HomePage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                //Confirm Button
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF0B8CAD),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      String? _phoneNumber =
                                          prefs.getString('nohp');
                                      var transactionData = {
                                        "merchants": data["merchant_username"],
                                        "customer": _phoneNumber,
                                        "amount": int.parse(jumlahController
                                            .text
                                            .replaceAll('.', ''))
                                      };
                                      context
                                          .read<QrScannedBloc>()
                                          .add(Transaction(transactionData));
                                    },
                                    color: Color(0xFFF4F7F8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      child: FittedBox(
                                        child: Text(
                                          'Konfirmasi Pembayaran',
                                          style: TextStyle(
                                            color: Color(0xFF0B8CAD),
                                            fontFamily: 'Montserrat',
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      //Filler when not Vissible
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _destinationProfile(BuildContext context, Uint8List bytes, data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //image
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.08,
                decoration: data["merchant_image"] != ''
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: MemoryImage(
                            bytes,
                          ),
                        ),
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                child: data['merchant_image'] == ''
                    ? CircleAvatar(
                        backgroundColor: Color(0xFF0485AC),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.04,
                          child: FittedBox(
                            child: Text(
                              data['merchant_name'] != ''
                                  ? data['merchant_name'][0]
                                      .toString()
                                      .toUpperCase()
                                  : '',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFFF4F7F8),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.006),
          //name
          Expanded(
            child: Container(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  data['merchant_name'].split(' ')[0],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Color(
                      0xFF999494,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.006),
          //phone Number
          Expanded(
            child: Container(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  data['phone_number'],
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF6c6565),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row nominalButtonTemplate(
      BuildContext context, String images, String nominal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image(
          image: AssetImage(images),
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.18,
          child: FittedBox(
            child: Text(
              "Rp $nominal",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
