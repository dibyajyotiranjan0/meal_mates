import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/notification/navigateScreen.dart';
import 'package:syflex_mealmatess_user/static/custom_color.dart';
import 'package:syflex_mealmatess_user/view/screen/food_delivery_screen_first.dart';

import '../../notification/localNotification.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // LocalNotificationService.initialize();
    mealMates();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        // print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          // print("New Notification");
          // print(message.data['_id']);
          if (message.data['_id'] != null) {
            LocalNotificationService.initialize(context, message);
            LocalNotificationService.createanddisplaynotification(message);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => NavigateScreen(
            //       id: message.data['_id'].toString() ?? "",
            //     ),
            //   ),
            // );
          } else
            LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.initialize(context, message);
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          // print(message.notification!.title);
          // print(message.notification!.body);
          // print("message.data22 ${message.data['_id']}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
  }

  void mealMates() {
    Timer(Duration(seconds: 3), () {
      SyflexMealmatesRepository().GetStarted(context);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => FoodDeliveryFirst_screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorSelect.yellow,
            ColorSelect.white,
            ColorSelect.white,
            ColorSelect.yellow,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // begin: const FractionalOffset(0.0, 0.0),
          // end: const FractionalOffset(1.0, 0.0),
          // stops: [0.0, 1.0],
          // tileMode: TileMode.clamp
        ),
      ),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 10),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("assets/logo/mealking.png"),
            ),
          )),
    );
  }
}
