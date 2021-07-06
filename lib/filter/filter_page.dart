import 'package:bill/filter/widgets/filter_widgets.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  FilterPage({Key? key}) : super(key: key);

  final bool topup = false;
  final bool pembayaran = false;
  final bool debit = false;
  final bool kredit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF4F7F8),
      appBar: _appBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectDate(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SaldoButton(),
            TransaksiButton(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            FilterButton(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Filter',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF423838),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF777E81),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        backgroundColor: Color(0xFFF4F7F8),
        elevation: 0.0);
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.045,
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.width * 0.045,
              MediaQuery.of(context).size.height * 0.01,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF8b8484)),
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                // aktifkan();
              },
              color: Color(0xFF0B8CAD),
              child: Text(
                'Proses',
                style: TextStyle(
                  color: Color(0xFFF4F7F8),
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.045,
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.width * 0.045,
              MediaQuery.of(context).size.height * 0.06,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(
                  0xFF2C81B7,
                ),
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                // setState(() {
                //   topup = false;
                //   pembayaran = false;
                //   debit = false;
                //   kredit = false;
                //   awalController.text = '';
                //   akhirController.text = '';
                //   dateAwal = first;
                //   dateAkhir = DateTime.now();
                // });
              },
              color: Color(0xFFF4F7F8),
              child: Text(
                'Atur Ulang',
                style: TextStyle(
                  color: Color(0xFF0B8CAD),
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
