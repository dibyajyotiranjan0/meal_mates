import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/view/screen/Home/home_page_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/discount/discount_code_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/my_cart/mycart_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/orders/orders.dart';
import 'package:syflex_mealmatess_user/view/screen/profile/profile_screen.dart';

class Bottom_NavScreen extends StatefulWidget {
  final int index;
  Bottom_NavScreen({this.index = 0, super.key});

  @override
  State<Bottom_NavScreen> createState() => _Bottom_NavScreenState();
}

class _Bottom_NavScreenState extends State<Bottom_NavScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
        initialIndex: widget.index,
        length: 4,
        vsync: this,
        animationDuration: Duration.zero);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage_Screen(),
          SizedBox(),
          Orders_screen(),
          Profile_screen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: _createTabBar(),
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        surfaceTintColor: Colors.white,
        //padding: EdgeInsets.zero,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyCartScreen()));
        },
        shape: CircleBorder(
            side: BorderSide(
                width: 7,
                color: Colors.transparent,
                strokeAlign: BorderSide.strokeAlignOutside)),
        tooltip: 'Add food item',
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.shopping_cart),
        elevation: 5.0,
      ),
    );
  }

  Widget _createTabBar() {
    return ColoredBox(
      color: Colors.transparent,
      child: TabBar(
        dividerColor: Colors.white,
        controller: _tabController,
        tabs: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Tab(
              icon: new Icon(
                Icons.other_houses,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 5),
            child: Tab(
              icon: new Icon(
                Icons.percent,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 5),
            child: Tab(
              icon: new Icon(
                Icons.description,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Tab(
              icon: new Icon(
                Icons.person,
                size: 30,
              ),
            ),
          )
        ],
        labelColor: Colors.pinkAccent,
        unselectedLabelColor: Colors.grey,
        indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(width: 5, color: Colors.pinkAccent),
            insets: EdgeInsets.symmetric(
              horizontal: 10,
            )),
      ),
    );
  }
}
