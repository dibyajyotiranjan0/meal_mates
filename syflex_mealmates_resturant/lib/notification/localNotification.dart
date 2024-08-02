import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? id) async {
      //   print("onSelectNotification");
      //   if (id!.isNotEmpty) {
      //     print("Router Value1234 $id");

      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => DemoScreen(
      //     //       id: id,
      //     //     ),
      //     //   ),
      //     // );

      //   }
      // },
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "mealkingresturant",
          "mealkingResturantpchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}

//if you call the ntification trough api or postman
//Api Url// https://fcm.googleapis.com/fcm/send
//header //Content-Type -> application/json
	// Authorization ->key=AAAAreRA0mw:APA91bGvTRVxEABpWoOr4irshG_MArL1ek9J4LMu9yQOdQsssHCKCX4wuc6dcxb1pNaw4BG5gYgypgUT7jpwdte4_Pa0l7mJ8tsDtZtgQxM-xBZjr8uWtTRe-X5jIRs1IMGvXKBkHez4 //this key is serverkey of firebaseproect

//JSON body //{
//     "registration_ids": [
//         "dJVh8FWXQ_2ipxYVpFaXCT:APA91bFyHc6mSyWHMgN7_iVDk5zB1WwB6qKlZGcxIpRBFnnxl4CRRi9qTCD3oLrJU6OY12AGzuM8_XZkEiWuwXUMc8nIlupjfrjIgNdzuhmq3bAOBYdw1z_8nmcSWyFNin24jkfgFTC5" // this sid is device id whose devce yu send the notification
//     ],
//     "notification": {
//         "body": "New Video has been uploaded",
//         "title": "Inventorcode",
//         "android_channel_id": "pushnotificationapp",
//         "sound": false
//     }
// }



