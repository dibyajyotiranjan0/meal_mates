import 'package:flutter/material.dart';
import 'package:syflex_mealmates_resturant/MyOrder_screen.dart';
import 'package:syflex_mealmates_resturant/product_screen.dart';
import 'package:syflex_mealmates_resturant/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int bottomTab_index = 0;

  late List bottom_tab = [MyOrderScreen(), ProductScreen(), SettingScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: bottomTab_index,
          onTap: (val) {
            setState(() {
              bottomTab_index = val;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: "My Orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined), label: "Food Menue"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ]),
      body: bottom_tab[bottomTab_index],
    );
  }
}
