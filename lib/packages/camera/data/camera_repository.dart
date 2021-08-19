import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CameraRepository {
  Future<dynamic> scanBarcode(String qrCode) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 3000,
    ));
    var response = await _dio.post(
      'transaction/get-transaction/',
      data: {
        "barcode": qrCode,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    print(response.data);
    return response.data;
  }

  Future<bool> payment(data) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 3000,
    ));
    var response = await _dio.post(
      'transaction/payment/',
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    print(response.data);
    if (response.data['message'] == 'Saldo Kurang') {
      return false;
    } else {
      print(response.data['data']);
      String merchantToken = response.data['message'];
      Map<String, String> fcmHeaders = <String, String>{
        'Content-type': 'application/json',
        'Authorization':
            'key=AAAAI7i8IeY:APA91bEm9EUPnCgZsQlPlxD9x8f-oom6lmrjUqw--qI2Yj00WGeR9JHnagnF-qS57LWHeWvRy0UTsVy-ecCYBQTOaW4A4pzIXtGP6AadJJOQgNtrzRxHEkZnFgKoRxaRsPEuPd8d46U_'
      };
      var map = new Map<String, String>();
      map['Content-type'] = 'application/json';
      map['Authorization'] =
          'key=AAAAI7i8IeY:APA91bEm9EUPnCgZsQlPlxD9x8f-oom6lmrjUqw--qI2Yj00WGeR9JHnagnF-qS57LWHeWvRy0UTsVy-ecCYBQTOaW4A4pzIXtGP6AadJJOQgNtrzRxHEkZnFgKoRxaRsPEuPd8d46U_';
      var fcmData = jsonEncode({
        "to": merchantToken,
        "notification": {
          "title": "transaksi berhasil",
          "body":
              "transaksi sebesar : Rp. ${data['amount']}  dari  ${data['customer']}  berhasil",
          "sound": "default"
        },
        "data": {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "status": "done",
          "notif": "vendorResult",
          "result": "Berhasil",
          "jumlah": data['amount'],
          "name": data['customer']
        }
      });
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      var responseFCM = await http.post(
        url,
        headers: fcmHeaders,
        body: fcmData,
      );
      print(responseFCM.body);
      return true;
    }
  }

  Future<dynamic> topupVoucher(data) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill-indonesia.com/api/',
      connectTimeout: 3000,
    ));
    var response = await _dio.post(
      'transaction/top-up-voucher/',
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
    print(response.data);
    return response.data;
  }
}
