import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';

import 'package:mobile_number/mobile_number.dart';

class AuthRepository {
  Future<bool> signinPhoneNumber(String _phoneNUmber) async {
    Dio _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill.co.id/',
      connectTimeout: 2000,
    ));
    Response response = await _dio.get('searchNotelp?notelp=$_phoneNUmber');

    if (response.toString() == 'Tidak') {
      return false;
    }
    return true;
  }

  Future<bool> signinPin(
    String _phoneNumber,
    String _pinNumber,
  ) async {
    Dio _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill.co.id/',
      connectTimeout: 3000,
    ));
    Response response = await _dio.get(
      'apiflutter?username=$_phoneNumber&password=$_pinNumber',
    );

    if (response.toString() == 'False') {
      return false;
    } else {
      return true;
    }
  }

  Future<void> getDeviceInfo() async {
    print('here');
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final deviceData =
        _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    final List<SimCard> simCards = await MobileNumber.getSimCards!;
    final test2 = simCards[1].carrierName;
    print(test2);
    print("""Device Model : ${deviceData['model']}
Device Brand : ${deviceData['brand']}
Device release : ${deviceData['version.release']}
Device OS : ${deviceData['version.sdkInt']}""");
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }
}
