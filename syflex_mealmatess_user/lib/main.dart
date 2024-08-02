import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/api/model/all_address-model.dart';
import 'package:syflex_mealmatess_user/firebase_options.dart';
import 'package:syflex_mealmatess_user/notification/localNotification.dart';
import 'package:syflex_mealmatess_user/static/color_theme_data.dart';
import 'package:syflex_mealmatess_user/static/custom_color.dart';
import 'package:syflex_mealmatess_user/view/screen/splash_screen.dart';

import 'Provider_stateManegement/categoryProvider.dart';
import 'Provider_stateManegement/food_product_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Provider_stateManegement/user_home.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

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
          create: (context) => ViewUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutOrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => UserProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            colorScheme: lightThemeColors(context),
            useMaterial3: true,
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 25, color: Colors.white),
              bodyMedium: TextStyle(fontSize: 17, color: Colors.black),
              titleLarge: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontSize: 15, color: Colors.black),
              displayLarge: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorSelect.white),
              displayMedium: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorSelect.black),
              headlineSmall: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorSelect.black),
            ),
            iconTheme: IconThemeData(color: Colors.black, weight: 4)),
        home: const SplashScreen(),
      ),
    );
  }
}
