import 'package:bill/main.dart';
import 'package:bill/pages/Login%20Pages/notelp.dart';
import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:bill/firebase_notification.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignupProfile extends StatelessWidget {
  final String nohp;
  final String pin;
  SignupProfile({this.nohp, this.pin});

  @override
  Widget build(BuildContext context) {
    return SignupProfilePage(nohp, pin);
  }
}

class SignupProfilePage extends StatefulWidget {
  final String nomer;
  final String pass;
  SignupProfilePage(this.nomer, this.pass);

  @override
  SignupProfilePageState createState() => new SignupProfilePageState();
}

class SignupProfilePageState extends State<SignupProfilePage> {
  // final emailController = TextEditingController();
  final nameController = TextEditingController();
  final tempatController = TextEditingController();
  final tanggalController = TextEditingController();
  String trackValue = 'Dari mana anda tau Bill ?';

  DateTime selectedDate = DateTime.now();

  File _image;
  var formatted;
  var user_role;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF4F7F8),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: Stack(children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/banner.png'),
                                  fit: BoxFit.fill))),
                      Column(children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top),
                            child: Row(children: <Widget>[
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: FittedBox(
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_back,
                                          color: Color(0xFFF4F7F8), size: 30),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: FittedBox(
                                      child: Text('Profil',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFF4F7F8)))))
                            ])),
                        Expanded(
                            child: GestureDetector(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: _image == null
                                                      ? AssetImage(
                                                          'images/unggah.png')
                                                      : FileImage(_image)))),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.32,
                                          child: FittedBox(
                                              child: Text('Unggah foto anda',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFFF4F7F8),
                                                      fontSize: 14))))
                                    ]),
                                onTap: () async {
                                  var image = await ImagePicker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 75,
                                      maxWidth: 1024,
                                      maxHeight: 1024);

                                  setState(() {
                                    _image = image;
                                  });
                                }))
                      ])
                    ])),
                Container(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
                        // Dari mana Anda tau bill
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: trackValue,
                              onChanged: (String newValue) {
                                setState(() {
                                  trackValue = newValue;
                                });
                              },
                              items: <String>[
                                'Dari mana anda tau Bill ?',
                                'Email',
                                'Teman',
                                'Website',
                                'Social Media',
                                'Lainnya'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00),
                            height: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                                border: Border(top: BorderSide(width: 0.5)))),
                        //input nama
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.width * 0.045,
                                0),
                            child: Text('Nama',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF999494)))),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00),
                            child: TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return 'Nama tidak boleh kosong';
                                }
                                return null;
                              },
                              controller: nameController,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6C6565)),
                              textAlign: TextAlign.left,
                              decoration: new InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.black87, width: 1.0))),
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.width * 0.045,
                                0),
                            child: Text('Tempat Lahir',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF999494)))),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00),
                            child: TextFormField(
                              controller: tempatController,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6C6565)),
                              textAlign: TextAlign.left,
                              decoration: new InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.black87, width: 1.0))),
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.width * 0.045,
                                0),
                            child: Text('Tanggal Lahir',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF999494)))),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00),
                            child: GestureDetector(
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: tanggalController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Masukan Tanggal Lahir';
                                      }
                                      return null;
                                    },
                                    autofocus: false,
                                  ),
                                ),
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(1900),
                                      maxTime: DateTime(2100),
                                      onConfirm: (date) {
                                    var picked = DateFormat('dd / MM / yyyy')
                                        .format(date);
                                    setState(() {
                                      selectedDate = date;
                                      tanggalController.text = picked;
                                    });
                                  },
                                      currentTime: selectedDate,
                                      locale: LocaleType.id);
                                })),
                        Visibility(
                          visible:
                              (trackValue != 'Dari mana anda tau Bill ?') &&
                                      (nameController.text != '') &&
                                      (tempatController.text != '') &&
                                      (tanggalController.text != '')
                                  ? true
                                  : false,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.045),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF8b8484)),
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () async {
                                try {
                                  createJournal();
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return WillPopScope(
                                          onWillPop: () async {
                                            Future.value(false);
                                          },
                                          child: Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFFF4F7F8)),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                } catch (e) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xFFF4F7F8)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: Center(
                                            child: Text(
                                              'Periksa koneksi internet anda',
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
                                      );
                                    },
                                  );
                                  Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(
                                      builder: (context) => new Login(),
                                    ),
                                  );
                                }
                              },
                              color: Color(0xFF0B8CAD),
                              child: Text(
                                'Simpan',
                                style: TextStyle(
                                  color: Color(0xFFF4F7F8),
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createJournal() async {
    Uri uri = Uri.parse('https://bill.co.id/createUser');
    if (DateFormat('dd/MM/yyyy').format(selectedDate) ==
        DateFormat('dd/MM/yyyy').format(DateTime.now())) {
      formatted = '';
    } else {
      formatted = DateFormat('MM/dd/yyyy').format(selectedDate);
    }
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['username'] = widget.nomer;
    request.fields['password'] = widget.pass;
    request.fields['name'] = nameController.text;
    request.fields['email'] = '';
    request.fields['tempat'] = tempatController.text;
    request.fields['tanggal'] = formatted;
    request.fields['tracking'] = trackValue;
    if (_image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', _image.path));
    }
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var urlCreateDataTransfer = 'https://bill.co.id/createDataTransfer';
      final responseCreateDataTransfer =
          await http.post(urlCreateDataTransfer, body: {
        'username': widget.nomer,
        'password': widget.pass,
        'name': nameController.text,
      });

      if (responseCreateDataTransfer.statusCode == 200) {
        Navigator.of(context, rootNavigator: true).pop();
        FirebaseNotifications().getToken();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('nohp', widget.nomer);
        prefs.setString('pin', widget.pass);
        prefs.setString('user_role', 'user');
        // var urlCreateJournal = 'https://bill.co.id/createJournal';
        // final responseCreateJournal = await http.post(
        //   urlCreateJournal,
        //   body: {
        //     'username': '05',
        //     'password': '111111',
        //     'result': widget.nomer,
        //     'amount': '1'.replaceAll('.', ''),
        //   },
        // );
        // print(
        //     'responseCreateJournal.statusCode = ${responseCreateJournal.statusCode}');
        // Navigator.pop(context, false);
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (context) => new Home(usr: 'user'),
          ),
        );
      } else {
        Navigator.of(context, rootNavigator: true).pop();
        return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF4F7F8)),
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Center(
                    child: Text('Gagal membuat akun',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF999494)),
                        textAlign: TextAlign.center),
                  ),
                ),
              );
            });
      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF4F7F8)),
                height: MediaQuery.of(context).size.height * 0.15,
                child: Center(
                  child: Text('Gagal membuat akun',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF999494),
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
            );
          });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   this.getUserRole();
  // }

  // void getUserRole() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     user_role = prefs.getString('user_role');
  //   });
  // }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
