import 'package:flutter/material.dart';
import 'package:bill/pages/saya.dart';
import 'package:bill/pages/ubahPin.dart';
import 'package:bill/pages/ubahNohp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfilePage();
  }
}

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  var nohp = '';
  var pin = '';
  var image = '';
  List data = List();
  File _image;
  bool done = false;

  final namaController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64.decode(image);
    return WillPopScope(
        onWillPop: () {
           Navigator.of(context).pop(); 
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0xFFF4F7F8),
            body: Column(
                // padding: EdgeInsets.all(0.0),
                children: <Widget>[
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: Stack(
                        children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/banner.png'),
                              fit: BoxFit.fill))),
                        Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top),
                                  child: 
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.1,
                                        child: FittedBox(
                                          child: IconButton(
                                            icon: Icon(Icons.arrow_back,
                                                color: Color(0xFFF4F7F8), 
                                                size: 30),
                                            onPressed: () {
                                               Navigator.of(context).pop(); 
                                            }))),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.185,
                                      child: FittedBox(
                                        child: Text('Sunting',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFF4F7F8)))))
                                  ]))
                                ]),
                          Expanded(
                              child: GestureDetector(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                         done == true
                                            ? Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width * 0.2,
                                                height: MediaQuery.of(context).size.width * 0.2,
                                                decoration: image != ''
                                                    ? BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: _image == null
                                                                ? MemoryImage(bytes)
                                                                : FileImage(_image)))
                                                    : _image != null
                                                        ? BoxDecoration(
                                                          shape: BoxShape.circle, 
                                                          image: DecorationImage(
                                                            fit: BoxFit.fill, 
                                                            image: FileImage(_image)))
                                                        : BoxDecoration(
                                                          shape: BoxShape.circle),
                                                child: image == '' 
                                                ? _image == null 
                                                  ? Container(
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    height: MediaQuery.of(context).size.width * 0.2,
                                                    child: CircleAvatar(
                                                    backgroundColor: Color(0xFF0485AC), 
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width * 0.06,
                                                      // color: Colors.red,
                                                      child: FittedBox(
                                                        child: Text(namaController.text != '' 
                                                        ? namaController.text[0] : '', 
                                                            style: TextStyle(
                                                                fontFamily: 'Montserrat',
                                                                color: Color(0xFFF4F7F8),
                                                                fontSize: 40))))
                                                      )) 
                                                  : Container() 
                                                : Container())
                                            : Shimmer.fromColors(
                                              baseColor: Colors.grey[300],
                                              highlightColor: Colors.grey[100],
                                              enabled: true,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width * 0.2,
                                                height: MediaQuery.of(context).size.width * 0.2,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle)))
                                      ]),
                                  onTap: () async {
                                    var image =
                                        await ImagePicker.pickImage(
                                            source: ImageSource.gallery,
                                            imageQuality: 75,
                                            maxWidth: 1024,
                                            maxHeight: 1024);

                                    setState(() {
                                      _image = image;
                                    });
                                  }))
                        ])]))),
                  Expanded(
                    flex: 2,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.72,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Column(children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.05,
                                        MediaQuery.of(context).size.width * 0.045,
                                        0),
                                    child: done == true
                                    ? Container(
                                        // color: Colors.green,
                                        width: MediaQuery.of(context).size.width * 0.12,
                                        child: FittedBox(
                                          child: Text('Nama',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xFF999494)))))
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey[300],
                                        highlightColor: Colors.grey[100],
                                        enabled: true,
                                          child: Container(
                                            // margin: EdgeInsets.only(
                                            //   top: MediaQuery.of(context).size.height * 0.01),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white),
                                            height: MediaQuery.of(context).size.height * 0.03,
                                            width: MediaQuery.of(context).size.width * 0.3))),
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.00,
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.00),
                                    child: done == true
                                    ? TextFormField(
                                        validator: (value) {
                                          if (value == '') {
                                            return 'Nama tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        decoration: new InputDecoration(
                                          focusedBorder: new UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                              color: Colors.black87, width: 1.0
                                            )
                                          )
                                        ),
                                        controller: namaController,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF6C6565)),
                                        textAlign: TextAlign.left,
                                      )
                                    : Shimmer.fromColors(
                                      baseColor: Colors.grey[300],
                                      highlightColor: Colors.grey[100],
                                      enabled: true,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * 0.01),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white),
                                          height: MediaQuery.of(context).size.height * 0.03,
                                          width: MediaQuery.of(context).size.width * 0.9))),
                                GestureDetector(
                                    child: Container(
                                        color: Color(0xFFF4F7F8),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.05,
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.02),
                                                        child: done == true
                                                        ? Container(
                                                            // color: Colors.green,
                                                            width: MediaQuery.of(context).size.width * 0.24,
                                                            child: FittedBox(
                                                              child: Text('Ubah No Hp',
                                                                style: TextStyle(
                                                                    fontFamily: 'Montserrat',
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                    color: Color(0xFF999494)))))
                                                        : Shimmer.fromColors(
                                                            baseColor: Colors.grey[300],
                                                            highlightColor: Colors.grey[100],
                                                            enabled: true,
                                                              child: Container(
                                                                // margin: EdgeInsets.only(
                                                                //   top: MediaQuery.of(context).size.height * 0.01),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: Colors.white),
                                                                height: MediaQuery.of(context).size.height * 0.03,
                                                                width: MediaQuery.of(context).size.width * 0.3))),
                                                    Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.00,
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.00),
                                                        child: done == true
                                                        ? Text(nohp,
                                                            style: TextStyle(
                                                                fontFamily: 'Montserrat',
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xFF6C6565)))
                                                        : Shimmer.fromColors(
                                                            baseColor: Colors.grey[300],
                                                            highlightColor: Colors.grey[100],
                                                            enabled: true,
                                                              child: Container(
                                                                margin: EdgeInsets.only(
                                                                  top: MediaQuery.of(context).size.height * 0.01),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: Colors.white),
                                                                height: MediaQuery.of(context).size.height * 0.03,
                                                                width: MediaQuery.of(context).size.width * 0.9)))
                                                  ]),
                                              done == true
                                              ? Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      MediaQuery.of(context).size.width * 0.045,
                                                      MediaQuery.of(context).size.width * 0.04,
                                                      MediaQuery.of(context).size.width * 0.045,
                                                      MediaQuery.of(context).size.width * 0.00),
                                                  child: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: Color(0xFF6C6565),
                                                      size: 30))
                                              : Container()
                                            ])),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new UbahNohp()));
                                    }),
                                done == true
                                ? Container(
                                    margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width *0.045,
                                    MediaQuery.of(context).size.height *0.013,
                                    MediaQuery.of(context).size.width *0.045,
                                    0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.black26, width: 1.0))))
                                : Container(),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.05,
                                        MediaQuery.of(context).size.width * 0.045,
                                        0),
                                    child: done == true
                                    ? Container(
                                        // color: Colors.green,
                                        width: MediaQuery.of(context).size.width * 0.12,
                                        child: FittedBox(
                                          child: Text('Email',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xFF999494)))))
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey[300],
                                        highlightColor: Colors.grey[100],
                                        enabled: true,
                                          child: Container(
                                            // margin: EdgeInsets.only(
                                            //   top: MediaQuery.of(context).size.height * 0.01),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white),
                                            height: MediaQuery.of(context).size.height * 0.03,
                                            width: MediaQuery.of(context).size.width * 0.3))),
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.00,
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.00),
                                    child: done == true
                                    ? TextFormField(
                                        validator: (value) {
                                          if (value == '') {
                                            return 'Email tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        controller: emailController,
                                        decoration: new InputDecoration(
                                          focusedBorder: new UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                              color: Colors.black87, width: 1.0
                                            )
                                          )
                                        ),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF6C6565)),
                                        textAlign: TextAlign.left,
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey[300],
                                        highlightColor: Colors.grey[100],
                                        enabled: true,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.height * 0.01),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white),
                                            height: MediaQuery.of(context).size.height * 0.03,
                                            width: MediaQuery.of(context).size.width * 0.9))),
                                GestureDetector(
                                    child: Container(
                                        color: Color(0xFFF4F7F8),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.05,
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.022),
                                                        child: done == true
                                                        ? Container(
                                                            // color: Colors.green,
                                                            width: MediaQuery.of(context).size.width * 0.2,
                                                            child: FittedBox(
                                                              child: Text('Ubah PIN',
                                                                style: TextStyle(
                                                                    fontFamily: 'Montserrat',
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                    color: Color(0xFF999494)))))
                                                        : Shimmer.fromColors(
                                                            baseColor: Colors.grey[300],
                                                            highlightColor: Colors.grey[100],
                                                            enabled: true,
                                                              child: Container(
                                                                // margin: EdgeInsets.only(
                                                                //   top: MediaQuery.of(context).size.height * 0.01),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: Colors.white),
                                                                height: MediaQuery.of(context).size.height * 0.03,
                                                                width: MediaQuery.of(context).size.width * 0.3))),
                                                    Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.00,
                                                            MediaQuery.of(context).size.width * 0.045,
                                                            MediaQuery.of(context).size.width * 0.00),
                                                        child: done == true
                                                        ? Text('******',
                                                            style: TextStyle(
                                                                fontFamily: 'Montserrat',
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xFF6C6565)))
                                                        : Shimmer.fromColors(
                                                            baseColor: Colors.grey[300],
                                                            highlightColor: Colors.grey[100],
                                                            enabled: true,
                                                              child: Container(
                                                                margin: EdgeInsets.only(
                                                                  top: MediaQuery.of(context).size.height * 0.01),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: Colors.white),
                                                                height: MediaQuery.of(context).size.height * 0.03,
                                                                width: MediaQuery.of(context).size.width * 0.9)))
                                                  ]),
                                              done == true
                                              ? Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      MediaQuery.of(context).size.width * 0.045,
                                                      MediaQuery.of(context).size.width * 0.04,
                                                      MediaQuery.of(context).size.width * 0.045,
                                                      MediaQuery.of(context).size.width * 0.00),
                                                  child: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: Color(0xFF6C6565),
                                                      size: 30))
                                              : Container()
                                            ])),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new UbahPin()));
                                    }),
                              done == true
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width *0.045,
                                  MediaQuery.of(context).size.height *0.013,
                                  MediaQuery.of(context).size.width *0.045,
                                  0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.black26, width: 1.0))))
                              : Container()
                              ])),
                              // Expanded(
                              //   flex: 2,
                              //   child: SizedBox(
                              //     height:
                              //         MediaQuery.of(context).size.height *
                              //             0.01)),
                              done == true
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.045,
                                      MediaQuery.of(context).size.width * 0.05,
                                      MediaQuery.of(context).size.width * 0.045,
                                      MediaQuery.of(context).size.width * 0.045),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFF8b8484)),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () async {
                                        updateProfile();
                                      },
                                      color: Color(0xFF0B8CAD),
                                      child: Text('Simpan',
                                          style: TextStyle(
                                              color: Color(0xFFF4F7F8),
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600))))
                                  : Shimmer.fromColors(
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.05,
                                        MediaQuery.of(context).size.width * 0.045,
                                        MediaQuery.of(context).size.width * 0.045),
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 0.07,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white)))
                            ])))
                ])));
  }

  @override
  void initState() {
    super.initState();
    this.getProfile();
  }

  void getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
    });

    var url = 'https://bill.co.id/getProfile';
    final response =
        await http.post(url, body: {'username': nohp, 'password': pin});

    data = jsonDecode(response.body);

    setState(() {
      if (data[0]['image'] == false) {
        image = '';
      } else {
        image = data[0]['image'];
      }
      namaController.text = data[0]['name'];
      emailController.text = data[0]['email'];
      done = true;
    });
  }

  void updateProfile() async {
    Uri uri = Uri.parse('https://bill.co.id/updateProfile');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['username'] = nohp;
    request.fields['password'] = pin;
    request.fields['name'] = namaController.text;
    request.fields['email'] = emailController.text;
    if (_image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', _image.path));
    }
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Saya()));
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                        child: Text('Gagal',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 16)))));
          });
    }
  }
}
