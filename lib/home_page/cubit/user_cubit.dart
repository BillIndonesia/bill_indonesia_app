import 'package:bill/packages/user/data/user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../packages/user/repository/user_repository.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository authRepo;
  UserCubit(
    this.authRepo,
  ) : super(UserState.initial());

  Future<void> fetchInitialData() async {
    emit(
      state.copyWith(loadingStatus: UserLoadingStatus.loading),
    );
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? _phoneNumber = prefs.getString('nohp');
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      var _dio = Dio();
      // ignore: cascade_invocations
      _dio.options = (BaseOptions(
        baseUrl: 'https://bill-indonesia.com/api/',
        connectTimeout: 5000,
      ));
      var formData = {
        "phone_number": _phoneNumber,
        "customer_firebase_token": token
      };
      var response = await _dio.post(
        '/customer/profile/',
        data: formData,
      );
      var userData = await authRepo.fetchUserInfo(response.data);
      emit(
        state.copyWith(
          name: userData.name,
          loadingStatus: UserLoadingStatus.success,
          data: userData,
        ),
      );
    } catch (e) {
      print('error here $e');
      emit(
        state.copyWith(
          loadingStatus: UserLoadingStatus.failure,
        ),
      );
    }
  }
}
