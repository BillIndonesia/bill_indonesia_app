import 'package:flutter/material.dart';

class BantuanHeader extends StatelessWidget implements PreferredSizeWidget {
  final useSearchBar;
  BantuanHeader(this.useSearchBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF4F7F8),
      elevation: 0.0,
      title: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Bantuan',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF423838),
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF777E81),
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
