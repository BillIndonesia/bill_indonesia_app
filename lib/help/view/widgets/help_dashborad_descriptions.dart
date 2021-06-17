import 'package:bill/help/model/bantuan_model.dart';
import 'package:bill/help/view/widgets/help_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BantuanDashboardDescriptions extends StatelessWidget {
  final index;
  BantuanDashboardDescriptions(this.index);

  @override
  Widget build(BuildContext context) {
    print(index);
    final data = Provider.of<BantuanModel>(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            BantuanHeader(false),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF0485AC),
                    Color(
                      0xFF36B8B6,
                    ),
                  ],
                ),
              ),
              child: Text(
                data.items[index].question,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Color(0xFFF4F7F8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Markdown(
                  data: data.items[index].description,
                  onTapLink: data.items[index].onClickText,
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    p: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16.5,
                        color: Color(0xFF5A5B5C),
                        fontFamily: 'Montserrat',
                        wordSpacing: 3),
                    blockSpacing: 20,
                  ),
                ),
              ),
            ),
            data.items[index].useEmail == true
                ? GestureDetector(
                    onTap: () {
                      launch(
                          "mailto:info@bill.co.id?subject=Bantuan&body=Halo admin bill, ");
                    },
                    child: Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0B8CAD),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Laporkan',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF5A5B5C),
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Icon(
                            Icons.email,
                            size: MediaQuery.of(context).size.width * 0.06,
                            color: Color(0xFF8B8B8B),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
