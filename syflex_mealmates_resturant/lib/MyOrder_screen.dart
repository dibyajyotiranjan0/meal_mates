import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/provider/offOnStsProvider.dart';
import 'package:syflex_mealmates_resturant/provider/resturant-product_provider.dart';
import 'package:syflex_mealmates_resturant/veryfy_order_screen.dart';

class MyOrderScreen extends StatefulWidget {
  // Map alldata;
  // MyOrderScreen({required this.alldata, super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  // late StreamController _numberStreamController;
  late TabController tabController;

  late bool _enable = false;
  late String valu = "Offline";

  // List<Map<String, dynamic>> val.neworder = [];
  // List<Map<String, dynamic>> val.processingorder = [];
  // List<Map<String, dynamic>> val.completeorder = [];
  // List<Map<String, dynamic>> val.rejecteorder = [];
  @override
  void initState() {
    // TODO: implement initState
    final provider =
        Provider.of<ResturatProductListProvider>(context, listen: false);
    provider.getAllOrder();
    super.initState();
    // _numberStreamController = StreamController();
    // AllData();
    //print(widget.alldata);
    // _numberStreamController;
    tabController = TabController(
        initialIndex: provider.index,
        length: 4,
        vsync: this,
        animationDuration: Duration.zero);
  }

  // stsUpdate(String id, String satus) async {
  //   var provider =
  //       Provider.of<ResturatProductListProvider>(context, listen: false);
  //   await provider.getSingleOrderStatusUpdate(id, satus);
  //   await provider.getAllOrder();

  //   // setState(() {});
  // }

  ActiveoffOnStatus(String status) async {
    // await SyflexMealmatesRepository().OnOffStsUpdate(status);
    var provider = Provider.of<OffOnstsProvider>(context, listen: false);

    await provider.onOffStsUpdate(status);
    // await provider.getproduct();
    //await SyflexMealmatesRepository().ProductStatusUpdate(id, status);
    //widget.updateState("update the states");
    // setState(() {});
  }

  stsUpdate(String id, String satus) async {
    var provider =
        Provider.of<ResturatProductListProvider>(context, listen: false);
    await provider.getSingleOrderStatusUpdate(id, satus);

    //AllData();
    // setState(() {});
  }

  AllData() async {
    final provider =
        Provider.of<ResturatProductListProvider>(context, listen: false);
    provider.getAllOrder();
  }

  @override
  void dispose() {
    // _numberStreamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ResturatProductListProvider>(context);
    //print("${provider.resturantLogin!.messages?.status}");
    // print("Buildcontext rebuild");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        titleSpacing: 5,
        centerTitle: false,
        title: FittedBox(
            fit: BoxFit.none,
            child: Transform.translate(
                offset: Offset(0, -5), child: Text("Home Screen"))),
        actions: [
          FittedBox(
            child: Consumer<OffOnstsProvider>(builder: (context, va, child) {
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
                                value:
                                    va.resturantLogin!.messages?.status?[0].acciesType ==
                                            "0"
                                        ? true
                                        : false,
                                onChanged: (bool val) => va.cloading
                                    ? null
                                    : ActiveoffOnStatus(va
                                                .resturantLogin!
                                                .messages
                                                ?.status?[0]
                                                .acciesType ==
                                            "0"
                                        ? "1"
                                        : "0"),
                                onFocusChange: (bool val) => va.cloading
                                    ? null
                                    : ActiveoffOnStatus(va
                                                .resturantLogin!
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
                          "${va.resturantLogin!.messages?.status?[0].acciesType == "0" ? "Online" : "Offline"}",
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
      body: Consumer<ResturatProductListProvider>(
          //<Object>
          // stream: _numberStreamController.stream,
          builder: (context, val, child) {
        // print(val.index);
        // if (val.connectionState == ConnectionState.waiting) {
        //   return Center(child: CircularProgressIndicator());
        // } else if (val.hasError) {
        //   return Text(
        //       'Error: ${val.error}'); // Display an error message if an error occurs.
        // } else if (!val.hasData) {
        //   return Text(
        //       'No data available'); // Display a message when no data is available.
        // } else {
        //   // print(val.data["messages"]["status"]["Orderdtls"]);
        //   for (var i = 0;
        //       i < val.data["messages"]["status"]["Orderdtls"].length;
        //       i++) {
        //     if (val.data["messages"]["status"]["Orderdtls"][i]
        //             ["status"] ==
        //         "1") {
        //       neworder
        //           .add(val.data["messages"]["status"]["Orderdtls"][i]);
        //       // setState(() {
        //       // if (neworder.length == 0) {
        //       //   neworder.add(
        //       //       val.data["messages"]["status"]["Orderdtls"][i]);
        //       // } else {
        //       //   for (var neworderi = 0;
        //       //       neworderi < neworder.length;
        //       //       neworderi++) {
        //       //     neworder[neworderi]["order_id"] ==
        //       //             val.data["messages"]["status"]["Orderdtls"]
        //       //                 [i]["order_id"]
        //       //         ? neworder
        //       //         : neworder.add(val.data["messages"]["status"]
        //       //             ["Orderdtls"][i]);
        //       //   }
        //       // }

        //       // });
        //     } else if (val.data["messages"]["status"]["Orderdtls"][i]
        //             ["status"] ==
        //         "2") {
        //       // setState(() {
        //       val.processingorder.length == 0
        //           ? val.processingorder.add(
        //               val.data["messages"]["status"]["Orderdtls"][i])
        //           : val.processingorder;
        //       // });
        //     } else if (val.data["messages"]["status"]["Orderdtls"][i]
        //             ["status"] ==
        //         "5") {
        //       // setState(() {
        //       val.completeorder.length == 0
        //           ? val.completeorder.add(
        //               val.data["messages"]["status"]["Orderdtls"][i])
        //           : val.completeorder;
        //       // });
        //     } else if (val.data["messages"]["status"]["Orderdtls"][i]
        //             ["status"] ==
        //         "8") {
        //       // setState(() {
        //       val.rejecteorder.length == 0
        //           ? val.rejecteorder.add(
        //               val.data["messages"]["status"]["Orderdtls"][i])
        //           : val.rejecteorder;
        //       // });
        //     } else {}
        // }
        // print(val.processingorder);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: 45,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 0),
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.zero,
                  // labelPadding: EdgeInsets.only(left: 0, right: 15),
                  // indicatorPadding: EdgeInsets.zero,
                  dividerColor: Colors.white,
                  indicator: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // shape: BoxShape.circle
                  ),
                  labelColor: Colors.white, //text of labs
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  onTap: (value) {
                    Provider.of<ResturatProductListProvider>(context,
                            listen: false)
                        .changeIndex(value);
                    // val.neworder.clear();
                    // val.processingorder.clear();
                    // val.rejecteorder.clear();
                    // AllData();
                    // setState(() {});
                  },
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: val.index == 0
                              ? Colors.pinkAccent[100]
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Text(
                          "New Order",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: val.index == 1
                              ? Colors.pinkAccent
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Text(
                          "processing",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: val.index == 2
                              ? Colors.pinkAccent
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Text(
                          "Complete",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: val.index == 3
                              ? Colors.pinkAccent
                              : Colors.grey.shade200,
                        ),
                        // padding: EdgeInsets.all(15),
                        child: Text(
                          "Rejected",
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
                    val.neworder != null
                        ? RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(Duration(seconds: 3), () {
                                AllData();
                              });
                              // setState(() {}); ///try this if the addition  order has not show the screen
                            },
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              physics: AlwaysScrollableScrollPhysics(),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: val.neworder.length,
                                  // itemCount: val
                                  //     .data["messages"]["status"]
                                  //         ["Orderdtls"]
                                  //     .length,
                                  itemBuilder: (context, intnew) {
                                    return InkWell(
                                      child: Container(
                                        height: 200,
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black12)),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Order #${val.neworder[intnew]["order_id"]}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                    "${val.neworder[intnew]["order_date"]}")
                                              ],
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(text: 'Name '),
                                                  TextSpan(
                                                    text:
                                                        '${val.neworder[intnew]["full_name"]}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black26),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: 'contact No: '),
                                                  TextSpan(
                                                    text:
                                                        '+91-${val.neworder[intnew]["contact_no"]}',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: 'Tootal Amount: '),
                                                  TextSpan(
                                                    text:
                                                        'RS ${val.neworder[intnew]["total_amount"]}',
                                                    style: TextStyle(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () => stsUpdate(
                                                        val.neworder[intnew]
                                                                ["order_id"]
                                                            .toString(),
                                                        "2"),
                                                    child: FittedBox(
                                                      fit: BoxFit.none,
                                                      child: Text(
                                                        "Acept",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.green),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  VerifyOrder_Details(
                                                                    OrderId: val
                                                                            .neworder[intnew]
                                                                        [
                                                                        "order_id"],
                                                                  )));
                                                    },
                                                    child: FittedBox(
                                                      fit: BoxFit.none,
                                                      child: Text(
                                                        "Details",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () => stsUpdate(
                                                        val.neworder[intnew]
                                                                ["order_id"]
                                                            .toString(),
                                                        "8"),
                                                    child: FittedBox(
                                                      fit: BoxFit.none,
                                                      child: Text(
                                                        "Rejected",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .redAccent),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : SizedBox(),
                    val.processingorder != null
                        ? RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(Duration(seconds: 3), () {
                                AllData();
                              });
                              // setState(() {}); ///try this if the addition  order has not show the screen
                            },
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: val.processingorder.length,
                                  // itemCount: val
                                  //     .data["messages"]["status"]
                                  //         ["Orderdtls"]
                                  //     .length,
                                  itemBuilder: (context, intnew) {
                                    return Container(
                                      height: 200,
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black12)),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Order #${val.processingorder[intnew]["order_id"]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                  "${val.processingorder[intnew]["order_date"]}")
                                            ],
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(text: 'Name '),
                                                TextSpan(
                                                  text:
                                                      '${val.processingorder[intnew]["full_name"]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black26),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(text: 'contact No: '),
                                                TextSpan(
                                                  text:
                                                      '+91-${val.processingorder[intnew]["contact_no"]}',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Tootal Amount: '),
                                                TextSpan(
                                                  text:
                                                      'RS ${val.processingorder[intnew]["total_amount"]}',
                                                  style: TextStyle(),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              VerifyOrder_Details(
                                                                OrderId: val.processingorder[
                                                                        intnew][
                                                                    "order_id"],
                                                              )));
                                                },
                                                child: FittedBox(
                                                  fit: BoxFit.none,
                                                  child: Text(
                                                    "Details",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : SizedBox(),
                    val.completeorder != null
                        ? RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(Duration(seconds: 3), () {
                                AllData();
                              });
                              // setState(() {}); ///try this if the addition  order has not show the screen
                            },
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: val.completeorder.length == 0
                                  ? SizedBox()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: val.completeorder.length,
                                      // itemCount: val
                                      //     .data["messages"]["status"]
                                      //         ["Orderdtls"]
                                      //     .length,
                                      itemBuilder: (context, intnew) {
                                        return Container(
                                          height: 200,
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.black12)),
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Order #${val.completeorder[intnew]["order_id"]}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                      "${val.completeorder[intnew]["order_date"]}")
                                                ],
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(text: 'Name '),
                                                    TextSpan(
                                                      text:
                                                          '${val.completeorder[intnew]["full_name"]}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black26),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: 'contact No: '),
                                                    TextSpan(
                                                      text:
                                                          '+91-${val.completeorder[intnew]["contact_no"]}',
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            'Tootal Amount: '),
                                                    TextSpan(
                                                      text:
                                                          'RS ${val.completeorder[intnew]["total_amount"]}',
                                                      style: TextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  VerifyOrder_Details(
                                                                    OrderId: val
                                                                            .completeorder[intnew]
                                                                        [
                                                                        "order_id"],
                                                                  )));
                                                    },
                                                    child: FittedBox(
                                                      fit: BoxFit.none,
                                                      child: Text(
                                                        "Details",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                            ),
                          )
                        : SizedBox(),
                    val.rejecteorder != null
                        ? RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(Duration(seconds: 3), () {
                                AllData();
                              });
                              // setState(() {}); ///try this if the addition  order has not show the screen
                            },
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: val.rejecteorder.length == 0
                                  ? SizedBox()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: val.rejecteorder.length,
                                      // itemCount: val
                                      //     .data["messages"]["status"]
                                      //         ["Orderdtls"]
                                      //     .length,
                                      itemBuilder: (context, intnew) {
                                        return Container(
                                          height: 200,
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black12)),
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Order #${val.rejecteorder[intnew]["order_id"]}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                      "${val.rejecteorder[intnew]["order_date"]}")
                                                ],
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(text: 'Name '),
                                                    TextSpan(
                                                      text:
                                                          '${val.rejecteorder[intnew]["full_name"]}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black26),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: 'contact No: '),
                                                    TextSpan(
                                                      text:
                                                          '+91-${val.rejecteorder[intnew]["contact_no"]}',
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            'Tootal Amount: '),
                                                    TextSpan(
                                                      text:
                                                          'RS ${val.rejecteorder[intnew]["total_amount"]}',
                                                      style: TextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  VerifyOrder_Details(
                                                                    OrderId: val
                                                                            .rejecteorder[intnew]
                                                                        [
                                                                        "order_id"],
                                                                  )));
                                                    },
                                                    child: FittedBox(
                                                      fit: BoxFit.none,
                                                      child: Text(
                                                        "Details",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                            ),
                          )
                        : SizedBox(),
                  ]),
            )
          ],
        );
        // Display the latest number when data is available.
        //}
      }),
    );
  }
}
