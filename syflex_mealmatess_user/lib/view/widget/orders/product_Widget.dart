import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/categoryProvider.dart';
import 'package:syflex_mealmatess_user/view/widget/orders/getSingleOrder_detais.dart';
import 'package:syflex_mealmatess_user/view/widget/orders/track_order.dart';

class ProductWidgtOf_Order extends StatefulWidget {
  ProductWidgtOf_Order({super.key});

  @override
  State<ProductWidgtOf_Order> createState() => _ProductWidgtOf_OrderState();
}

class _ProductWidgtOf_OrderState extends State<ProductWidgtOf_Order> {
  bool _customTileExpanded = false;
  @override
  void initState() {
    // TODO: implement initState
    // allorderList();
    super.initState();
  }

  allorderList() {
    var provider = Provider.of<ViewUserProvider>(context, listen: false);
    provider.getAllOrderPrvider();
  }

  Future CancelOrder() {
    return showModalBottomSheet<void>(
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text

        // Returning SizedBox instead of a Container
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Cancel Order",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.black12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Aare you sure you want to cancel thi order?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            //CancelOrder();
                          },
                          child: Text(
                            "Caancel Order",
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.red, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Remove",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pinkAccent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.red),
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewUserProvider>(builder: (context, vaal, child) {
      return vaal.getAllOrderModel!.data!.orderdtls!.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 3), () {
                  allorderList();
                });
                // setState(() {}); ///try this if the addition  order has not show the screen
              },
              color: Colors.black,
              backgroundColor: Colors.white,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vaal.getAllOrderModel!.data!.orderdtls!.length,
                  itemBuilder: (context, int) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetSingleOrderDetails(
                                        OrderSumery: vaal.getAllOrderModel!
                                            .data!.orderdtls![int]
                                            .toJson(),
                                      ))),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: Colors.grey,
                                      textColor: Colors.black,
                                      contentPadding: EdgeInsets.zero,
                                      isThreeLine: true,
                                      leading: vaal.getAllOrderModel!.data!
                                                  .orderdtls![int].logoImage !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  "https://collegeprojectz.com/mealmate/uploads/${vaal.getAllOrderModel!.data!.orderdtls![int].logoImage}",
                                              width: 50,
                                              height: 50,
                                            )
                                          : Image.asset(
                                              "assets/logo/mealmates.png",
                                              width: 50,
                                              height: 50,
                                            ),
                                      title: Text(
                                        "${vaal.getAllOrderModel!.data!.orderdtls![int].restaurantName ?? ""}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "${vaal.getAllOrderModel!.data!.orderdtls![int].addressDtls![0].state ?? ""},${vaal.getAllOrderModel!.data!.orderdtls![int].addressDtls![0].cityname ?? ""},${vaal.getAllOrderModel!.data!.orderdtls![int].addressDtls![0].pincode ?? ""}",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      trailing: SizedBox(
                                        height: 30,
                                        width: 70,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.zero),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ))),
                                            child: FittedBox(
                                                child: Text(
                                              "Delivered",
                                              style: TextStyle(fontSize: 12),
                                            ))),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: vaal
                                                .getAllOrderModel!
                                                .data!
                                                .orderdtls![int]
                                                .orderDtls!
                                                .length,
                                            itemBuilder: (context, intt) {
                                              return Row(
                                                children: [
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                            color:
                                                                Colors.green)),
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                      "${vaal.getAllOrderModel!.data!.orderdtls![int].orderDtls![intt].qty ?? 1}"),
                                                  Icon(
                                                    Icons.close,
                                                    size: 12,
                                                  ),
                                                  Text(
                                                    "${vaal.getAllOrderModel!.data!.orderdtls![int].orderDtls![intt].productname ?? ""}",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              );
                                            }),
                                        Divider(
                                          color: Colors.black26,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "${vaal.getAllOrderModel!.data!.orderdtls![int].orderDate ?? ""}"),
                                              Text(
                                                  "\u{20B9}${vaal.getAllOrderModel!.data!.orderdtls![int].totalAmount}")
                                            ]),
                                        Divider(
                                          color: Colors.black26,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                CancelOrder();
                                              },
                                              child: Text(
                                                "Caancel Order",
                                                style: TextStyle(
                                                    color: Colors.pinkAccent),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: Colors.red,
                                                              width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)))),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TrackOrder()));
                                              },
                                              child: Text(
                                                "Track order",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.pinkAccent),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .red),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)))),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }))
          : SizedBox();
    });

    // return Consumer<ViewUserProvider>(builder: (context, vaal, child) {
    //   return vaal.getAllOrderModel!.data!.isNotEmpty
    //       ? RefreshIndicator(
    //           onRefresh: () async {
    //             await Future.delayed(Duration(seconds: 3), () {
    //               allorderList();
    //             });
    //             // setState(() {}); ///try this if the addition  order has not show the screen
    //           },
    //           color: Colors.black,
    //           backgroundColor: Colors.white,
    //           child: ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: vaal.getAllOrderModel!.data!.length,
    //               itemBuilder: (context, int) {
    //                 return Column(
    //                   children: [
    //                     Container(
    //                       padding: EdgeInsets.all(10),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(15),
    //                           color: Colors.white,
    //                           boxShadow: [
    //                             BoxShadow(
    //                               color: Colors.grey,
    //                               blurRadius: 5.0,
    //                             )
    //                           ]),
    //                       child: ListTileTheme(
    //                         contentPadding: EdgeInsets.all(0),
    //                         minVerticalPadding: 0,
    //                         dense: true,
    //                         horizontalTitleGap: 10.0,
    //                         minLeadingWidth: 0,
    //                         child: ExpansionTile(
    //                           tilePadding: EdgeInsets.zero,
    //                           leading: Container(
    //                             height: 50,
    //                             width: 50,
    //                             margin: EdgeInsets.zero,
    //                             decoration: vaal
    //                                         .getAllOrderModel!.data![int].img !=
    //                                     null
    //                                 ? BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(10),
    //                                     color: Colors.red,
    //                                     image: DecorationImage(
    //                                         fit: BoxFit.fill,
    //                                         image: CachedNetworkImageProvider(
    //                                           "https://collegeprojectz.com/mealmate/uploads/${vaal.getAllOrderModel!.data![int].img!}",
    //                                         )),
    //                                   )
    //                                 : BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(10),
    //                                     color: Colors.red,
    //                                   ),
    //                           ),
    //                           title: Align(
    //                             alignment: Alignment.centerLeft,
    //                             child: FittedBox(
    //                               fit: BoxFit.none,
    //                               child: vaal.getAllOrderModel!.data![int]
    //                                           .productname! ==
    //                                       ""
    //                                   ? Text(
    //                                       "ABC Resturant",
    //                                       maxLines: 2,
    //                                       style: TextStyle(
    //                                           color: Colors.black,
    //                                           fontSize: 18,
    //                                           fontWeight: FontWeight.bold),
    //                                     )
    //                                   : Text(
    //                                       "${vaal.getAllOrderModel!.data![int].productname!.length > 17 ? vaal.getAllOrderModel!.data![int].productname!.substring(0, 17) : vaal.getAllOrderModel!.data![int].productname!}",
    //                                       maxLines: 2,
    //                                       style: TextStyle(
    //                                           color: Colors.black,
    //                                           fontSize: 18,
    //                                           fontWeight: FontWeight.bold),
    //                                     ),
    //                             ),
    //                           ),
    //                           subtitle: Text(
    //                             "Grand city St 100 ew York, unted states",
    //                             maxLines: 2,
    //                             style: TextStyle(
    //                                 color: Colors.black, fontSize: 14),
    //                           ),
    //                           trailing: FittedBox(
    //                             fit: BoxFit.none,
    //                             child: Container(
    //                               height: 50,
    //                               //width: 100,
    //                               alignment: Alignment.topCenter,
    //                               child: Row(
    //                                 children: [
    //                                   FittedBox(
    //                                     child: Text(
    //                                       "View menu",
    //                                       style: TextStyle(
    //                                           color: Colors.pinkAccent,
    //                                           fontWeight: FontWeight.bold,
    //                                           fontSize: 12),
    //                                     ),
    //                                   ),
    //                                   Icon(
    //                                     Icons.arrow_drop_down,
    //                                     color: Colors.pinkAccent,
    //                                     size: 25,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                           children: <Widget>[
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               crossAxisAlignment: CrossAxisAlignment.center,
    //                               children: [
    //                                 Container(
    //                                   height: 15,
    //                                   width: 15,
    //                                   decoration: BoxDecoration(
    //                                       shape: BoxShape.rectangle,
    //                                       border:
    //                                           Border.all(color: Colors.green)),
    //                                   child: Icon(
    //                                     Icons.circle,
    //                                     color: Colors.green,
    //                                     size: 12,
    //                                   ),
    //                                 ),
    //                                 Expanded(
    //                                   child: Text(
    //                                     "05 jul 2023 at 4:30PM",
    //                                     overflow: TextOverflow.fade,
    //                                     maxLines: 2,
    //                                   ),
    //                                 ),
    //                                 Text(
    //                                   "\u{20B9}${78}",
    //                                   overflow: TextOverflow.fade,
    //                                   style:
    //                                       TextStyle(color: Colors.pinkAccent),
    //                                 )
    //                               ],
    //                             ),
    //                             Divider(
    //                               color: Colors.black26,
    //                             ),
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               crossAxisAlignment: CrossAxisAlignment.center,
    //                               children: [
    //                                 Expanded(
    //                                   child: Text(
    //                                     "05 jul 2023 at 4:30PM",
    //                                     overflow: TextOverflow.fade,
    //                                     maxLines: 2,
    //                                   ),
    //                                 ),
    //                                 Text(
    //                                   "\u{20B9}${78}",
    //                                   overflow: TextOverflow.fade,
    //                                   style:
    //                                       TextStyle(color: Colors.pinkAccent),
    //                                 )
    //                               ],
    //                             ),
    //                             Divider(
    //                               color: Colors.black26,
    //                             ),
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               crossAxisAlignment: CrossAxisAlignment.center,
    //                               children: [
    //                                 ElevatedButton(
    //                                   onPressed: () {
    //                                     CancelOrder();
    //                                   },
    //                                   child: Text(
    //                                     "Caancel Order",
    //                                     style:
    //                                         TextStyle(color: Colors.pinkAccent),
    //                                   ),
    //                                   style: ButtonStyle(
    //                                       backgroundColor:
    //                                           MaterialStateProperty.all(
    //                                               Colors.white),
    //                                       shape: MaterialStateProperty.all(
    //                                           RoundedRectangleBorder(
    //                                               side: BorderSide(
    //                                                   color: Colors.red,
    //                                                   width: 2),
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       25)))),
    //                                 ),
    //                                 ElevatedButton(
    //                                   onPressed: () {
    //                                     Navigator.push(
    //                                         context,
    //                                         MaterialPageRoute(
    //                                             builder: (context) =>
    //                                                 TrackOrder()));
    //                                   },
    //                                   child: Text(
    //                                     "Track order",
    //                                     style: TextStyle(color: Colors.white),
    //                                   ),
    //                                   style: ButtonStyle(
    //                                       backgroundColor:
    //                                           MaterialStateProperty.all(
    //                                               Colors.pinkAccent),
    //                                       shape: MaterialStateProperty.all(
    //                                           RoundedRectangleBorder(
    //                                               side: BorderSide(
    //                                                   color: Colors.red),
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       25)))),
    //                                 )
    //                               ],
    //                             )
    //                           ],
    //                           onExpansionChanged: (bool expanded) {
    //                             setState(() => _customTileExpanded = expanded);
    //                           },
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     )
    //                   ],
    //                 );
    //               }),
    //         )
    //       : SizedBox();
    // });
  }
}
