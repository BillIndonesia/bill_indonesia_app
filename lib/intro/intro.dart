import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroPage();
  }
}

class IntroPage extends StatefulWidget {
  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  List<Slide> slides = [];
  @override
  void didChangeDependencies() {
    slides.add(
      new Slide(
        marginTitle:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        centerWidget: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'assets/images/billslide1.png',
                    ),
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  FadeInImage(
                    placeholder: AssetImage(''),
                    image: AssetImage(
                      'assets/images/slide1.png',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015)
                ])),
        backgroundColor: Color(0xFF00A5DF),
      ),
    );
    slides.add(
      new Slide(
        marginTitle:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        centerWidget: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  'assets/images/billslide2.png',
                ),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image(
                image: AssetImage(
                  'assets/images/slide2.png',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015)
            ],
          ),
        ),
        backgroundColor: Color(0xFFFDB724),
      ),
    );
    slides.add(
      new Slide(
        marginTitle:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        centerWidget: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  'assets/images/billslide3.png',
                ),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image(
                image: AssetImage(
                  'assets/images/slide3.png',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF8EBB5C),
      ),
    );
    slides.add(
      new Slide(
        marginTitle:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        centerWidget: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  'assets/images/billslide4.png',
                ),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image(
                image: AssetImage(
                  'assets/images/slide4.png',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFBE5A5A),
      ),
    );
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.didChangeDependencies();
    super.initState();
  }

  void onDonePress() async {
    Navigator.of(context).pushNamed('/SignInPhoneNumberScreen');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        onSkipPress: this.onDonePress,
      ),
    );
  }
}
