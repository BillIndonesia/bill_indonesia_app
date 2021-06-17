import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBalanceCard extends StatelessWidget {
  const UserBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userBalance = context.watch<UserCubit>().state.data.saldo.toString();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFF0485AC),
              Color(0xFF36B8B6),
            ],
          ),
        ),
        child: Container(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              userBalance == '-0' ? 'Rp 0' : 'Rp ' + userBalance,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                // fontSize: 22,
                color: Color(
                  0xFFF4F7F8,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
