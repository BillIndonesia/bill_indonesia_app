import 'dart:convert';
import 'dart:typed_data';

import 'package:bill/packages/user/model/image_mock.dart';
import 'package:flutter/material.dart';

class HistoryItemPhoto extends StatelessWidget {
  const HistoryItemPhoto({
    Key? key,
    required String image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _image;
  final String _name;

  @override
  Widget build(BuildContext context) {
    final Uint8List bytes = base64.decode(ImageMockUp().image);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.0095,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: _image != ''
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: MemoryImage(
                      bytes,
                    ),
                  ),
                )
              : BoxDecoration(shape: BoxShape.circle),
          child: _image == ''
              ? CircleAvatar(
                  backgroundColor: _name != 'Akun ini telah dihapus'
                      ? Color(0xFF0485AC)
                      : Color(0xFFF4F7F8),
                  child: Center(
                    child: (_name != 'Bonus Top Up' && _name != 'Voucher')
                        ? _name != 'Akun ini telah dihapus'
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.04,
                                child: FittedBox(
                                  child: Text(
                                    _name != '' ? _name[0] : '',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFFF4F7F8),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                        : Image.asset(
                            'assets/images/textbill.png',
                            width: MediaQuery.of(context).size.width * 0.085,
                            height: MediaQuery.of(context).size.width * 0.085,
                          ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
