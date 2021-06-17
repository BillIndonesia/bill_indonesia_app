import 'package:bill/help/model/bantuan_model.dart';
import 'package:bill/help/view/widgets/help_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BantuanDashboard extends StatefulWidget {
  @override
  _BantuanDashboardState createState() => _BantuanDashboardState();
}

class _BantuanDashboardState extends State<BantuanDashboard> {
  @override
  Widget build(BuildContext context) {
    final question = Provider.of<BantuanModel>(context);

    return Container(
      child: ListView.builder(
        itemCount: question.items.length,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            child: ChangeNotifierProvider.value(
              value: question.items[index],
              child: BantuanDashoardQuestions(),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BantuanDashboardDescriptions(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
