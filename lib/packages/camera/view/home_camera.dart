import 'dart:io';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/packages/user/model/image_mock.dart';
import 'package:bill/transaction/screens/input_payment/PayKWK.dart';
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
          if (state.type == ScannedType.voucher) {
            Navigator.of(context).pushNamed('/TopUpVoucherScreen');
          } else if (state.type == ScannedType.angkot) {
            Navigator.of(context).pushReplacement(
              new MaterialPageRoute(
                builder: (context) => new PayKwk(
                  nohpResult: '05',
                  name: 'Muhammad Vikral',
                  noHpUser: '08121400480000',
                  pinUser: '111111',
                  angkotName: 'TestAngkot',
                  angkotImage: ImageMockUp().image,
                  tipe: '',
                ),
              ),
            );
          }
        }
        if (state.formStatus is SubmissionFailed) {}
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.43,
        child: _buildQrView(context),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) {
        controller.scannedDataStream.listen(
          (value) {
            controller.pauseCamera();
            context.read<QrScannedBloc>().add(
                  QrCodeScanned(
                    value.code,
                  ),
                );
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
