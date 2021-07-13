import 'package:dio/dio.dart';

class CameraRepository {
  Future<dynamic> scanBarcode(String qrCode) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://dev.bill-indonesia.com/api/',
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
      baseUrl: 'https://dev.bill-indonesia.com/api/',
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
      return true;
    }
  }

  Future<bool> topupVoucher(data) async {
    var _dio = Dio();
    // ignore: cascade_invocations
    _dio.options = (BaseOptions(
      baseUrl: 'https://dev.bill-indonesia.com/api/',
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
    if (response.data['message'] == 'transaksi Berhasil') {
      return true;
    } else {
      return false;
    }
  }
}
