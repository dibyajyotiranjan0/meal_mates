import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_meamates/firebase_options.dart';
import 'package:syflex_meamates/notification/localNotification.dart';
import 'package:syflex_meamates/notification/notification_screen.dart';
import 'package:syflex_meamates/provider/orderProvider.dart';
import 'package:syflex_meamates/provider/sign_provider.dart';
import 'package:syflex_meamates/screen/Signup/docment_upload.dart';
import 'package:syflex_meamates/screen/Signup/documents_al.dart';
import 'package:syflex_meamates/screen/manage_vechile.dart';
import 'package:syflex_meamates/screen/my_order_screen.dart';
import 'package:syflex_meamates/screen/order_screen.dart';
import 'package:syflex_meamates/screen/splash_screen.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => signProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: NotificationScreen(),
        home: SplashScreen(),
      ),
    );
  }
}
