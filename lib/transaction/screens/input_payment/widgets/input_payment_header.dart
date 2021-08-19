import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class InputPaymentHeader extends StatelessWidget {
  const InputPaymentHeader({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final Uint8List bytes;
    bytes = base64.decode(data['merchant_image']);
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Card(
            color: Color(0xFFE4F2FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: _destinationProfile(context, bytes),
            ),
          ),
        ),
        InputPaymentForm(),
      ],
    );
  }

  Expanded _destinationProfile(BuildContext context, Uint8List bytes) {
    return Expanded(
      child: Container(
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
      ),
    );
  }
}

class InputPaymentForm extends StatefulWidget {
  const InputPaymentForm({
    Key? key,
  }) : super(key: key);

  @override
  _InputPaymentFormState createState() => _InputPaymentFormState();
}

class _InputPaymentFormState extends State<InputPaymentForm> {
  final jumlahController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    vertical: MediaQuery.of(context).size.height * 0.01,
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class AlwaysEnabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}
