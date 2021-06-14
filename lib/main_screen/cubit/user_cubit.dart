import 'dart:convert';

import 'package:bill/packages/user/data/user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      Dio _dio = Dio();
      _dio.options = (BaseOptions(
        baseUrl: 'https://dev.bill-indonesia.com',
        connectTimeout: 300,
      ));
      Map<String, dynamic> data = {
        "phone_number": "081214004800",
        "customer_password": "111111"
      };
      var dataBody = jsonEncode(data);
      Response response = await _dio.post(
        '/customer/login',
        data: dataBody,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status == 301;
          },
        ),
      );
      print(response.statusCode);
      var userData = await authRepo.fetchUserInfo();
      emit(
        state.copyWith(
          name: userData.name,
          loadingStatus: UserLoadingStatus.success,
          data: userData,
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          loadingStatus: UserLoadingStatus.failure,
        ),
      );
    }
  }
}
