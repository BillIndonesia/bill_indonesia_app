import 'package:bill/help/view/widgets/help_widgets.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    // final question = Provider.of<BantuanModel>(context).items;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF4F7F8),
        appBar: BantuanHeader(false),
        body: Column(
          children: <Widget>[
            Expanded(child: BantuanDashboard()),
          ],
        ),
      ),
    );
  }
}
