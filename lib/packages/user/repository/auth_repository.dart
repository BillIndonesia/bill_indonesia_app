import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<bool> delayedMockup() async {
    var test = false;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        test = true;
      },
    );
    return test;
  }

  Future<bool> signinPhoneNumber(String _phoneNUmber) async {
    var _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 3000,
    ));
    var formData = FormData.fromMap(
      {
        "phone_number": _phoneNUmber,
      },
    );

    print('here');
    var response = await _dio.post(
      'customer/customerdetail/',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    print(response.statusCode);

    if (response.data['message'] == "Customer Not Found") {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> signinPin(
    String _phoneNumber,
    String _pinNumber,
  ) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 3000,
    ));
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // ignore: omit_local_variable_types
    String? token = await messaging.getToken();
    var formData = FormData.fromMap(
      {
        "phone_number": _phoneNumber,
        "customer_password": _pinNumber,
        "customer_firebase_token": token
      },
    );
    var response = await _dio.post(
      '/customer/login/',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );

    if (response.data['message'] == "Password is not valid") {
      return false;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nohp', _phoneNumber);
      prefs.setString('pin', _pinNumber);
      return true;
    }
  }

  Future<bool> signUpOTP(
      String phoneNumber, String otpCode, String type) async {
    var _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 3000,
    ));
    var formData = FormData.fromMap(
      {
        "userkey": "63rtc4",
        "passkey": "OdooOdooNg",
        "to": phoneNumber,
        "message": "kode otp anda $otpCode",
        "otp_type": type,
      },
    );

    print('here');
    var response = await _dio.post(
      '/customer/sendOTP/',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    print(response.data);
    return true;
  }

  Future<bool> signUpProfile({
    required String customerName,
    required String phoneNumber,
    required String password,
    required String bornPlace,
    required String bornDate,
  }) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 5000,
    ));
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    Map<String, dynamic> mapData = {
      "customer_name": customerName,
      "customer_borndate": bornDate,
      "customer_password": password,
      "phone_number": phoneNumber,
      "customer_bornplace": bornPlace,
      "firebase_token": token
    };
    String data = jsonEncode(mapData);
    var response = await _dio.post(
      '/customer/register/',
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    print(response.data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nohp', phoneNumber);
    prefs.setString('pin', password);
    return true;
  }

  Future<bool> editProfile({
    required String id,
    required String customerName,
    required String bornPlace,
    required String bornDate,
    required String image,
  }) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 5000,
    ));
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    Map<String, dynamic> mapData = {
      "customer_name": customerName,
      "customer_borndate": bornDate,
      "customer_bornplace": bornPlace,
      "customer_image": image,
      "firebase_token": token
    };
    String data = jsonEncode(mapData);
    var response = await _dio.put(
      'customer/update_profile/$id/',
      data: data,
      // options: Options(
      //   followRedirects: false,
      //   validateStatus: (status) {
      //     return status! <= 500;
      //   },
      // ),
    );
    print(response.data);
    return true;
  }
//   Future<void> getDeviceInfo() async {
//     print('here');
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     final deviceData =
//         _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
//     final List<SimCard> simCards = await MobileNumber.getSimCards!;
//     final test2 = simCards[1].carrierName;
//     print(test2);
//     print("""Device Model : ${deviceData['model']}
// Device Brand : ${deviceData['brand']}
// Device release : ${deviceData['version.release']}
// Device OS : ${deviceData['version.sdkInt']}""");
//   }

//   Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       'version.securityPatch': build.version.securityPatch,
//       'version.sdkInt': build.version.sdkInt,
//       'version.release': build.version.release,
//       'version.previewSdkInt': build.version.previewSdkInt,
//       'version.incremental': build.version.incremental,
//       'version.codename': build.version.codename,
//       'version.baseOS': build.version.baseOS,
//       'board': build.board,
//       'bootloader': build.bootloader,
//       'brand': build.brand,
//       'device': build.device,
//       'display': build.display,
//       'fingerprint': build.fingerprint,
//       'hardware': build.hardware,
//       'host': build.host,
//       'id': build.id,
//       'manufacturer': build.manufacturer,
//       'model': build.model,
//       'product': build.product,
//       'supported32BitAbis': build.supported32BitAbis,
//       'supported64BitAbis': build.supported64BitAbis,
//       'supportedAbis': build.supportedAbis,
//       'tags': build.tags,
//       'type': build.type,
//       'isPhysicalDevice': build.isPhysicalDevice,
//       'androidId': build.androidId,
//       'systemFeatures': build.systemFeatures,
//     };
//   }

}
