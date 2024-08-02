import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/categoryProvider.dart';
import 'package:syflex_mealmatess_user/view/widget/appbar_widget_screen.dart';
import 'package:syflex_mealmatess_user/view/widget/orders/activeorder_screen.dart';

class Orders_screen extends StatefulWidget {
  Orders_screen({super.key});

  @override
  State<Orders_screen> createState() => _Orders_screenState();
}

class _Orders_screenState extends State<Orders_screen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int index = 0;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: index);
    allOrder();
    // TODO: implement initState
    super.initState();
  }

  allOrder() {
    final provider = Provider.of<ViewUserProvider>(context, listen: false);
    provider.getAllOrderPrvider();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ViewUserProvider>(context, listen: false);
    // print(provider.getAllOrderModel!.toJson());
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/logo/mealmates.png"),
              ),
            ),
          ),
          title: Text(
            "Orders",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          bottom: TabBar(
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.black26,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Complited",
                ),
                Tab(
                  text: "Cancel",
                )
              ]),
        ),
        body: Consumer<ViewUserProvider>(builder: (context, val, child) {
          return val.getAllOrderModel != null
              ? TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [ActiveOrderScreen(), SizedBox(), SizedBox()])
              : SizedBox();
        })); //
  }
}
