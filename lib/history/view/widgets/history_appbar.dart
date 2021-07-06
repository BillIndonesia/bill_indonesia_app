import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HistoryAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Riwayat Transaksi',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF423838),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffE5E5E5),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            'assets/images/filter.png',
            width: MediaQuery.of(context).size.width * 0.06,
            height: MediaQuery.of(context).size.width * 0.06,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
