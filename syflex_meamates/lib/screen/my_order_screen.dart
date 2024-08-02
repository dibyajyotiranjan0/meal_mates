import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_meamates/model/userlog_profile.dart';
import 'package:syflex_meamates/provider/orderProvider.dart';
import 'package:syflex_meamates/provider/sign_provider.dart';
import 'package:syflex_meamates/screen/manage_vechile.dart';
import 'package:syflex_meamates/screen/menu/document_page.dart';
import 'package:syflex_meamates/screen/menu/pdfView.dart';
import 'package:syflex_meamates/screen/menu/profile_details.dart';
import 'package:syflex_meamates/screen/menu/vechcle_page.dart';
import 'package:syflex_meamates/screen/order_screen.dart';

import 'Signup/documents_al.dart';
import 'order/completeorder_deliveryboy.dart';
import 'order/neworder_screen.dart';
import 'order/processinorder_deliveryboy.dart';

class MOrderScreen extends StatefulWidget {
  String phone;
  MOrderScreen({required this.phone, super.key});

  @override
  State<MOrderScreen> createState() => _MOrderScreenState();
}

class _MOrderScreenState extends State<MOrderScreen>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  int index = 0;
  // late UserLogDetails _userLogDetails;
  ActiveoffOnStatus(String offon) async {
    // await SyflexMealmatesRepository().OnOffStsUpdate(status);
    var provider = Provider.of<signProvider>(context, listen: false);

    await provider.deliveryBoyoffon(offon);
    // await provider.getproduct();
    //await SyflexMealmatesRepository().ProductStatusUpdate(id, status);
    //widget.updateState("update the states");
    // setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    userprofileLoginDetails();

    super.initState();

    // allNewOrder();
    tabController = TabController(
        initialIndex: index,
        length: 3,
        vsync: this,
        animationDuration: Duration.zero);
  }

  // AllData() async {
  //   final provider =
  //       Provider.of<ResturatProductListProvider>(context, listen: false);
  //   provider.getAllOrder();
  // }

  userprofileLoginDetails() async {
    final provider = await Provider.of<signProvider>(context, listen: false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenId = prefs.getString('token_id');
    await provider.deliveryBoyLoginProfile(widget.phone, tokenId ?? "");
  }

  List<Map<String, dynamic>> sbCategoryicon = [
    {"icon": Icons.home, "onpress": ""},
    {"icon": Icons.account_circle, "onpress": ProfileDetails()},
    {"icon": Icons.local_shipping, "onpress": VechicleScreen()},
    {"icon": Icons.description, "onpress": DocumentScreen()},
    {"icon": Icons.history, "onpress": ""},
    {"icon": Icons.account_balance_wallet, "onpress": ""},
    {"icon": Icons.money, "onpress": ""},
    {"icon": Icons.settings, "onpress": ""},
    {"icon": Icons.logout, "onpress": ""}
  ];
  List<Map<String, dynamic>> sbCategory = [
    {"menu": "Home"},
    {"menu": "My Profile"},
    {"menu": "Manage Vechicle"},
    {"menu": "Documents"},
    {"menu": "History"},
    {"menu": "Wallet"},
    {"menu": "Withdraw"},
    {"menu": "Setting"},
    {"menu": "logout"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          // margin: EdgeInsets.all(5),
                          //padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.red, width: 3),
                            // image: DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image: AssetImage("assets/image/logo.jpeg")
                            //     )
                          ),
                          child: Stack(children: [
                            Container(
                              // height: 60,
                              // width: 60,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: const Color.fromARGB(255, 223, 170, 170),
                                  // border:
                                  // Border.all(color: Colors.pink, width: 3),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/mealmates.png"))),
                              // child: FittedBox(
                              //     child: Image.asset(
                              //   "assets/image/mealmates.png",
                              //   fit: BoxFit.cover,
                              // )),
                            ),
                            Positioned(
                                bottom: 8,
                                right: 5,
                                child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(0.4),
                                  child: Icon(
                                    Icons.edit_square,
                                    color: Colors.pink[600],
                                  ),
                                )),
                          ]),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Samir Sahoo",
                              style: TextStyle(
                                  color: Colors.pink[600],
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "+91 1234567892",
                              style: TextStyle(
                                  color: Colors.pink[600],
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ]),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, int) {
                      return ListTile(
                        textColor: Colors.black,
                        iconColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 50),
                        tileColor: Colors.white,
                        minLeadingWidth: 0,
                        onTap: () => sbCategoryicon[int]["onpress"] == ""
                            ? Navigator.pop(context)
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sbCategoryicon[int]
                                        ["onpress"])), //ProfileDetails()
                        leading: Icon(
                          sbCategoryicon[int]["icon"],
                          size: 20,
                          color: Colors.black87,
                        ),
                        title: Text(
                          sbCategory[int]["menu"],
                          style: TextStyle(
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        shape: Border(
                          bottom:
                              BorderSide(width: 2, color: Colors.grey.shade100),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My Orders"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          FittedBox(
            child: Consumer<signProvider>(builder: (context, va, child) {
              // print("Consumber build");
              return va.cloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: FittedBox(
                            child: Switch(
                                // value: true,
                                value: va.userLogDetails!.messages?.status?[0]
                                            .acciesType ==
                                        "1"
                                    ? false
                                    : true,
                                onChanged: (bool val) => va.cloading
                                    ? {print("CValue is true")}
                                    : ActiveoffOnStatus(va
                                                .userLogDetails!
                                                .messages
                                                ?.status?[0]
                                                .acciesType ==
                                            "0"
                                        ? "1"
                                        : "0"),
                                onFocusChange: (bool val) => va.cloading
                                    ? null
                                    : ActiveoffOnStatus(va
                                                .userLogDetails!
                                                .messages
                                                ?.status?[0]
                                                .acciesType ==
                                            "0"
                                        ? "1"
                                        : "0")),
                          ),
                        ),
                        FittedBox(
                            child: Text(
                          "${va.userLogDetails!.messages?.status?[0].acciesType == "0" ? "Online" : "Offline"}",
                          style: TextStyle(fontSize: 12),
                        ))
                      ],
                    );
            }),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: TabBar(
                  controller: tabController,
                  isScrollable: false,
                  //indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.white,
                  indicator: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // shape: BoxShape.circle
                  ),
                  labelColor: Colors.white, //text of labs
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  onTap: (value) {
                    index = value;
                    setState(() {});
                  },
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: index == 0
                              ? Colors.pinkAccent[100]
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Now Order",
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: index == 1
                              ? Colors.pinkAccent
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "processing",
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: index == 2
                              ? Colors.pinkAccent
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Complete",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    NewOrderScreen(),
                    prcessingorder(),
                    completeorderDeliveryboy()
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
