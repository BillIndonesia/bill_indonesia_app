import 'package:flutter/material.dart';
import 'package:bill/pages/notelp.dart';
import 'dart:async';

import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  Intro({this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return IntroPage(navigatorKey);
  }
}

class IntroPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navkey;

  IntroPage(this.navkey);

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(
            top: MediaQuery.of(widget.navkey.currentContext).size.height * 0.03),
        centerWidget: Container(
            height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('images/billslide1.png')),
                  FadeInImage(
                    placeholder: AssetImage(''),
                    image: AssetImage('images/slide1.png')),
                  // Image(image: AssetImage('images/slide1.png')),
                  SizedBox(height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.015)
                ])),
        // pathImage: 'images/slide1.png',
        // widthImage: MediaQuery.of(widget.navkey.currentContext).size.width,
        // heightImage:
        //     MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
        backgroundColor: Color(0xFF00A5DF),
        // foregroundImageFit: BoxFit.fill,
      ),
    );
    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(
            top: MediaQuery.of(widget.navkey.currentContext).size.height * 0.03),
        centerWidget: Container(
            height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('images/billslide2.png')),
                  Image(image: AssetImage('images/slide2.png')),
                  SizedBox( height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.015)
                ])),
        // pathImage: 'images/slide2.png',
        // widthImage: MediaQuery.of(widget.navkey.currentContext).size.width,
        // heightImage:
        //     MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
        backgroundColor: Color(0xFFFDB724),
        // foregroundImageFit: BoxFit.fill,
      ),
    );
    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(
            top: MediaQuery.of(widget.navkey.currentContext).size.height * 0.03),
        centerWidget: Container(
            height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('images/billslide3.png')),
                  Image(image: AssetImage('images/slide3.png')),
                  SizedBox(height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.015)
                ])),
        // pathImage: 'images/slide3.png',
        // widthImage: MediaQuery.of(widget.navkey.currentContext).size.width,
        // heightImage:
        //     MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
        backgroundColor: Color(0xFF8EBB5C),
        // foregroundImageFit: BoxFit.fill,
      ),
    );
    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(
            top:
                MediaQuery.of(widget.navkey.currentContext).size.height * 0.03),
        centerWidget: Container(
            height:
                MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('images/billslide4.png')),
                  Image(image: AssetImage('images/slide4.png')),
                  SizedBox(
                      height: MediaQuery.of(widget.navkey.currentContext).size.height * 0.015)
                ])),
        // pathImage: 'images/slide4.png',
        // widthImage: MediaQuery.of(widget.navkey.currentContext).size.width,
        // heightImage:
        //     MediaQuery.of(widget.navkey.currentContext).size.height * 0.75,
        backgroundColor: Color(0xFFBE5A5A),
        // foregroundImageFit: BoxFit.fill,
      ),
    );
  }

  void onDonePress() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NoTelp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onDonePress,
      styleNameSkipBtn: TextStyle(color: Colors.black),
      styleNameDoneBtn: TextStyle(color: Colors.black),
    );
  }
}
