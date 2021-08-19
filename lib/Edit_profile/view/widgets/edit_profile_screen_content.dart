import 'package:bill/Edit_profile/bloc/edit_profile_bloc.dart';
import 'package:bill/Edit_profile/view/widgets/edit_profile_widgets.dart';
import 'package:bill/home_page/cubit/user_cubit.dart';
import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreenContent extends StatefulWidget {
  static final GlobalKey<FormState> _editFormKey = GlobalKey();

  EditProfileScreenContent({Key? key}) : super(key: key);

  @override
  _EditProfileScreenContentState createState() =>
      _EditProfileScreenContentState();
}

class _EditProfileScreenContentState extends State<EditProfileScreenContent> {
  final nameController = TextEditingController();
  final bornPlaceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    super.didChangeDependencies();
  }

  @override
  void didChangeDependencies() {
    final userData = context.watch<UserCubit>().state.data;
    print("did ${userData.bornDate}");
    final intialData = {
      'customer_name': userData.name,
      'born_place': userData.bornplace,
      'born_date': userData.bornDate,
      'merchant_image': userData.image,
    };
    context.read<EditProfileBloc>().add(EditProfileInitialData(intialData));
    Future.delayed(Duration(milliseconds: 100), () {
      var data = context.read<EditProfileBloc>().state;
      nameController.text = data.name;
      bornPlaceController.text = data.bornPlace;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listenWhen: (prevState, state) {
        return prevState.formStatus is FormSubmitting;
      },
      listener: (context, state) {
        if (state.formStatus is SubmissionSuccess) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.width * 0.06),
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F7F8)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: FittedBox(
                            child: Text(
                              'Edit Profile Succes',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF999494),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            MaterialButton(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                child: FittedBox(
                                  child: Text(
                                    'Oke',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0B8CAD),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/HomeScreen',
                                  (Route<dynamic> route) => false,
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        if (state.formStatus is SubmissionError) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Periksa koneksi internet anda',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF999494),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          MaterialButton(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              child: FittedBox(
                                child: Text(
                                  'Oke',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0B8CAD),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: EditProfileScreenContent._editFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditProfileHeader(),
                    //Input Nama
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.width * 0.045,
                            0,
                          ),
                          child: Text(
                            'Nama',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF999494,
                              ),
                            ),
                          ),
                        ),
                        //editName
                        BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                              ),
                              child: TextFormField(
                                controller: nameController,
                                autofocus: false,
                                autovalidateMode: state.showErrorMessages
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                onChanged: (teks) {
                                  context
                                      .read<EditProfileBloc>()
                                      .add(NameFormChanged(teks));
                                },
                                validator: (value) {
                                  if (state.name == '') {
                                    return 'Nama tidak boleh kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6C6565),
                                ),
                                textAlign: TextAlign.left,
                                decoration: new InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                      color: Colors.black87,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    //Input Tempat Lahir
                    BlocBuilder<EditProfileBloc, EditProfileState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.width * 0.045,
                                0,
                              ),
                              child: Text(
                                'Tempat Lahir',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(
                                    0xFF999494,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.00,
                              ),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(13),
                                ],
                                controller: bornPlaceController,
                                autovalidateMode: state.showErrorMessages
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                onChanged: (teks) {
                                  context
                                      .read<EditProfileBloc>()
                                      .add(BornPlaceFormChanged(teks));
                                },
                                validator: (value) {
                                  if (value == '') {
                                    return 'Tempat lahir tidak boleh kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6C6565),
                                ),
                                textAlign: TextAlign.left,
                                decoration: new InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                      color: Colors.black87,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    //Input Tanggal Lahir
                    EditProfileBornDate(),
                    //Button
                    BlocBuilder<EditProfileBloc, EditProfileState>(
                      builder: (context, state) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.2,
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.045,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF8b8484)),
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
                            onPressed: () async {
                              EditProfileScreenContent
                                  ._editFormKey.currentState!
                                  .validate();
                              if (EditProfileScreenContent
                                  ._editFormKey.currentState!
                                  .validate()) {
                                var data = context.read<UserCubit>().state.data;
                                String _phoneNumber = data.phoneNumber;
                                context.read<EditProfileBloc>().add(
                                      FromSubmitted(
                                        phoneNumber: _phoneNumber,
                                        password: data.id.toString(),
                                      ),
                                    );
                              }
                            },
                            color: Color(0xFF0B8CAD),
                            child: state.formStatus is FormSubmitting
                                ? CircularProgressIndicator()
                                : Text(
                                    'Simpan',
                                    style: TextStyle(
                                      color: Color(0xFFF4F7F8),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
