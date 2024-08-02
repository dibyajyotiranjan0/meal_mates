import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/orderProvider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //allNewOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Order #694",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Consumer<OrderProvider>(builder: (context, val, chld) {
            // print(val.newOrderDeieryboy!.toJson());
            return val.newOrderDeieryboy != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(right: 15, bottom: 15),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200),
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "nana msmem",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Pick up information",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Map it",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.pink[200],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            "RAPHAEL",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            thickness: 1.0,
                            indent: 0.2,
                            height: 1,
                          ),
                          Text(
                            "+91 86********",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          ),
                          Text(
                            "stre@gmail.com",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          ),
                          Text(
                            "Okera Faisabad rd Okera Faisabad rd ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 1.0,
                        indent: 0.2,
                        height: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Delivery information",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Map it",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.pink[200],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            "RAPHAEL",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            thickness: 1.0,
                            indent: 0.2,
                            height: 10.0,
                          ),
                          Text(
                            "+91 86********",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          ),
                          Text(
                            "stre@gmail.com",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          ),
                          Text(
                            "Okera Faisabad rd Okera Faisabad rd ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 1.0,
                        indent: 0.2,
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "item Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 1.0,
                        indent: 0.2,
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: Image.asset(
                                  "assets/image/google_icon.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.green,
                                      ),
                                      title: Text(
                                        "Firm Villa Pizza",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1 Dish",
                                          // style:
                                          //     TextStyle(fontSize: 20, color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Normal(6 inches)",
                                            // style: TextStyle(overflow: TextOverflow.fade),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // ListTile(
                                    //   contentPadding: EdgeInsets.zero,
                                    //   minLeadingWidth: 0,
                                    //   isThreeLine: true,
                                    //   title:
                                    //   subtitle:
                                    // ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '\u{20B9}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '20',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: Image.asset(
                                  "assets/image/google_icon.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      visualDensity: VisualDensity(
                                          horizontal: -4, vertical: 0),
                                      dense: true,
                                      leading: Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.green,
                                      ),
                                      title: Text(
                                        "Firm Villa Pizza",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1 Dish",
                                          // style:
                                          //     TextStyle(fontSize: 20, color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Normal(6 inches)",
                                            // style:
                                            //     TextStyle(fontSize: 20, color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // ListTile(
                                    //   contentPadding: EdgeInsets.zero,
                                    //   minLeadingWidth: 0,
                                    //   isThreeLine: true,
                                    //   title:
                                    //   subtitle:
                                    // ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '\u{20B9}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '20',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "item Name",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Cash On Delivery",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 1,
                        indent: 0.2,
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "\u{20B9} ${40}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ),
      ),
    );
  }
}
