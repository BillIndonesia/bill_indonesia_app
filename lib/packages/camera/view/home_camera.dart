import 'dart:io';
import 'package:bill/global/widgets/slow_connection_dialog.dart';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/transaction/screens/input_payment/input_payment_sreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeCamera extends StatefulWidget {
  @override
  _HomeCameraState createState() => _HomeCameraState();
}

class _HomeCameraState extends State<HomeCamera> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return BlocListener<QrScannedBloc, QrScannedState>(
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
          Navigator.of(context).pop();

          if (state.type == ScannedType.voucher) {
            Navigator.of(context).pushNamed('/TopUpVoucherScreen');
          } else if (state.type == ScannedType.angkot) {
            Navigator.of(context).pushReplacement(
              new MaterialPageRoute(
                builder: (context) => new InputPaymentScreen(),
              ),
            );
          } else if (state.type == ScannedType.notFound) {
            userNotFoundDialog(context);
          }
        }
        if (state.formStatus is SubmissionError) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SlowConnectionDialog(),
                      MaterialButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: FittedBox(
                            child: Text(
                              'Coba Lagi',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B8CAD),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // context.read<UserCubit>().fetchInitialData();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.37,
        child: _buildQrView(context),
      ),
    );
  }

  Future<dynamic> userNotFoundDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.06),
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF4F7F8)),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: FittedBox(
                    child: Text(
                      'User tidak ditemukan',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF999494),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MaterialButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        child: FittedBox(
                          child: Text(
                            'Oke',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B8CAD),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) async {
        controller.scannedDataStream.listen(
          (value) {
            print(value.code.replaceAll('#', ''));
            controller.pauseCamera();
            context.read<QrScannedBloc>().add(
                  QrCodeScanned(
                    value.code.replaceAll('#', ''),
                  ),
                );
            Future.delayed(Duration(seconds: 3), () {
              controller.resumeCamera();
            });
          },
        );
      },
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
