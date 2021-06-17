import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class HistoryItemAmount extends StatelessWidget {
  final double amount;
  const HistoryItemAmount({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fo = MoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbol: 'IDR',
        fractionDigits: 3,
        compactFormatType: CompactFormatType.long,
      ),
    );
    return fo.output.withoutFractionDigits.length < 10
        ? Container(
            child: Text(
              ' Rp ' + fo.output.withoutFractionDigits,
              style: TextStyle(
                color: Color(0xFF6C6565),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
              ),
            ),
          )
        : Container(
            child: Text(
              ' Rp ' + fo.output.compactNonSymbol,
              style: TextStyle(
                color: Color(0xFF6C6565),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
              ),
            ),
          );
  }
}
