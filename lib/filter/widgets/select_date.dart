import 'package:bill/filter/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatefulWidget {
  SelectDate({
    Key? key,
  }) : super(key: key);

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  final awalController = TextEditingController();
  final akhirController = TextEditingController();
  DateTime dateAkhir = DateTime.now();
  DateTime dateAwal = DateTime.now();
  final DateTime first = DateTime(2021);
  bool setAwal = false;
  bool setAkhir = false;
  final String awal = '';
  final String akhir = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {
        if (state.endDate == '' && state.startDate == '') {
          setState(() {
            awalController.text = '';
            akhirController.text = '';
          });
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF423838),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tanggal awal',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xFF999494),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                          ),
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: awalController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.09,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                suffixIcon: Image.asset(
                                  'assets/images/calendar.png',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          selectDate(context, 'awal');
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tanggal akhir',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xFF999494),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01),
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: akhirController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  suffixIcon: Image.asset(
                                    'assets/images/calendar.png',
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        onTap: () {
                          selectDate(context, 'akhir');
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void selectDate(BuildContext context, String tipe) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tipe == 'awal'
          ? dateAwal
          : akhirController.text == ''
              ? dateAwal
              : dateAkhir,
      firstDate: tipe == 'awal' ? first : dateAwal,
      lastDate: DateTime.now(),
      fieldHintText: 'dd/MM/yyyy',
    );

    var date = DateFormat('dd-MM-yyyy').format(picked!);
    var dateToFilter = DateFormat('yyyy-MM-dd').format(picked);
    var endDate =
        DateFormat('yyyy-MM-dd').format(picked.add(Duration(days: 1)));
    if (picked != DateTime.now())
      setState(() {
        if (tipe == 'awal') {
          setAwal = true;
          dateAwal = picked;
          awalController.text = date;
          print('picked $dateToFilter');
          BlocProvider.of<FilterCubit>(context).changeStartDate(dateToFilter);
        } else {
          setAkhir = true;
          dateAkhir = picked;
          akhirController.text = date;
          print('picked $dateToFilter');
          BlocProvider.of<FilterCubit>(context).changeEndDate(endDate);
        }
      });
  }
}
