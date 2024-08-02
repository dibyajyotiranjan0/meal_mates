import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/api/model/mycart_model.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';

import '../../screen/my_cart/address_screen.dart';

class Deliver1stWidget extends StatefulWidget {
  List<CartItems> cartItem;
  Deliver1stWidget({required this.cartItem, super.key});

  @override
  State<Deliver1stWidget> createState() => _Deliver1stWidgetState();
}

class _Deliver1stWidgetState extends State<Deliver1stWidget> {
  Map? defailtAddressData;
  @override
  void initState() {
    // TODO: implement initState
    address();
    super.initState();
  }

  address() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    defailtAddressData =
        await jsonDecode(prefs.getString('address').toString());
    return defailtAddressData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3, bottom: 0, top: 0),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          //shape: BoxShape.circle, // BoxShape.circle or BoxShape.retangle
          //color: const Color(0xFF66BB6A),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ]),
      child: Column(children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddressScreen_order(
                          cartItem: widget.cartItem,
                        )));
          },
          textColor: Colors.black,
          iconColor: Colors.black,
          title: Text("Deliver to"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
        Divider(
          color: Colors.black45,
          height: 2,
        ),
        Consumer<CheckoutOrderProvider>(builder: (context, vaal, child) {
          return vaal.defailtAddressData != null
              ? ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  // minLeadingWidth: 10,
                  contentPadding: EdgeInsets.zero,
                  isThreeLine: true,
                  // leading: CircleAvatar(
                  //   radius: 20,
                  //   backgroundImage: AssetImage("assets/logo/mealmates.png"),
                  // ),
                  title: Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.none,
                        child: Text(
                          "${vaal.defailtAddressData!["first_name"] ?? ""} ${vaal.defailtAddressData!["last_name"] ?? ""}",
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        color: Colors.pink.withOpacity(0.2),
                        child: Text(
                          "Default",
                          style:
                              TextStyle(fontSize: 14, color: Colors.pinkAccent),
                        ),
                      )
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "state:${vaal.defailtAddressData!["state"] ?? ""}, city:${vaal.defailtAddressData!["cityname"] ?? ""}, Pin:${vaal.defailtAddressData!["pincode"] ?? ""}, PhoneNo.: ${vaal.defailtAddressData!["number"] ?? ""} ",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "Address1: ${vaal.defailtAddressData!["address1"] ?? ""} ",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "Address2: ${vaal.defailtAddressData!["adress2"] ?? ""} ",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              : defailtAddressData != null
                  ? ListTile(
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      // minLeadingWidth: 10,
                      contentPadding: EdgeInsets.zero,
                      isThreeLine: true,
                      // leading: CircleAvatar(
                      //   radius: 20,
                      //   backgroundImage: AssetImage("assets/logo/mealmates.png"),
                      // ),
                      title: Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.none,
                            child: Text(
                              "${defailtAddressData!["first_name"] ?? ""} ${defailtAddressData!["last_name"] ?? ""}",
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            color: Colors.pink.withOpacity(0.2),
                            child: Text(
                              "Default",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.pinkAccent),
                            ),
                          )
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "state:${defailtAddressData!["state"] ?? ""}, city:${defailtAddressData!["cityname"] ?? ""}, Pin:${defailtAddressData!["pincode"] ?? ""}, PhoneNo.: ${defailtAddressData!["number"] ?? ""} ",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "Address1: ${defailtAddressData!["address1"] ?? ""} ",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "Address2: ${defailtAddressData!["adress2"] ?? ""} ",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  : SizedBox();
          // : FutureBuilder(
          //     future: address(),
          //     builder: (context, snapshot) {
          //       // print(defailtAddressData);
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         if (snapshot.hasError) {
          //           return ErrorWidget(Exception(
          //               'Error occured when fetching data from database'));
          //         } else if (!snapshot.hasData) {
          //           return const Center(child: Text('Bandit is empty!'));
          //         } else {
          //           return defailtAddressData != null
          //               ? ListTile(
          //                   textColor: Colors.black,
          //                   iconColor: Colors.black,
          //                   // minLeadingWidth: 10,
          //                   contentPadding: EdgeInsets.zero,
          //                   isThreeLine: true,
          //                   // leading: CircleAvatar(
          //                   //   radius: 20,
          //                   //   backgroundImage: AssetImage("assets/logo/mealmates.png"),
          //                   // ),
          //                   title: Row(
          //                     children: [
          //                       FittedBox(
          //                         fit: BoxFit.none,
          //                         child: Text(
          //                           "${defailtAddressData!["first_name"] ?? ""} ${defailtAddressData!["last_name"] ?? ""}",
          //                           maxLines: 3,
          //                           style: TextStyle(
          //                               fontSize: 18,
          //                               color: Colors.black,
          //                               fontWeight: FontWeight.bold),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 20,
          //                       ),
          //                       Container(
          //                         color: Colors.pink.withOpacity(0.2),
          //                         child: Text(
          //                           "Default",
          //                           style: TextStyle(
          //                               fontSize: 14,
          //                               color: Colors.pinkAccent),
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                   subtitle: Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         "state:${defailtAddressData!["state"] ?? ""}, city:${defailtAddressData!["cityname"] ?? ""}, Pin:${defailtAddressData!["pincode"] ?? ""}, PhoneNo.: ${defailtAddressData!["number"] ?? ""} ",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black54),
          //                       ),
          //                       Text(
          //                         "Address1: ${defailtAddressData!["address1"] ?? ""} ",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black54),
          //                       ),
          //                       Text(
          //                         "Address2: ${defailtAddressData!["adress2"] ?? ""} ",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black54),
          //                       ),
          //                     ],
          //                   ),
          //                 )
          //               : SizedBox();
          //         }
          //       }
          //     });
        }),
      ]),
    );
  }
}
