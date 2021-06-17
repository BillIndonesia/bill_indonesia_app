import 'package:bill/transaction/screens/top_up_voucher/top_up_voucher_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FCMInit {
  void initializeFCM() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FCMInit().initApp();
    FCMInit().whenGetNotificationsInit();
  }

  //initialize Awesome Flutter

  //Initialize Token
  void initApp() async {
    // ignore: omit_local_variable_types
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // ignore: omit_local_variable_types
    String? token = await messaging.getToken();
    debugPrint('testing $token: $token');
    var url = Uri.parse('https://bill.co.id/saveToken');
    await http.post(
      url,
      body: {
        'username': '05',
        'password': '111111',
        'token': token,
      },
    );
  }

  //Initialize onMessage
  void whenGetNotificationsInit() {
    AndroidNotificationChannel? channel;
    FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint('got a message listen : ${message.notification.hashCode}');
        Get.to(
          () => const TopUpVoucher(
            key: Key('test page'),
          ),
        );
        // ignore: omit_local_variable_types
        RemoteNotification? notification = message.notification;
        // ignore: omit_local_variable_types
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel.name,
                channel.description,
                priority: Priority.high,
                importance: Importance.max,
                enableVibration: true,
                icon: 'launch_background',
              ),
            ),
          );
        }
      },
    );
  }
}
