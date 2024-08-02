import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/view/screen/food/resturant_food_item.dart';
import 'package:syflex_mealmatess_user/view/widget/home/resturantScree.dart';
import 'package:syflex_mealmatess_user/static/static_url.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../screen/food/search_food.dart';

class ResturantSingleScreen extends StatefulWidget {
  ResturantSingleScreen({super.key});

  @override
  State<ResturantSingleScreen> createState() => _ResturantSingleScreenState();
}

class _ResturantSingleScreenState extends State<ResturantSingleScreen> {
  bool category = false;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutOrderProvider>(builder: (context, vlu, child) {
      return vlu.userHomeModel!.messages!.status!.restaurantdata!.length == 0
          ? SizedBox()
          : ListView.builder(
              shrinkWrap: true,
              itemCount:
                  vlu.userHomeModel!.messages!.status!.restaurantdata!.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, int) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => singleResturantFoodItems(
                                  resurant_id: vlu.userHomeModel!.messages!
                                      .status!.restaurantdata![int].restaurantId
                                      .toString(),
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(8),
                    height: 150,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            //spreadRadius: 5,
                            offset: Offset(0, 3),
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
                            child: vlu.userHomeModel!.messages!.status!
                                        .restaurantdata![int].primaryImage !=
                                    null
                                ? CachedNetworkImage(
                                    imageUrl:
                                        "https://mealking.in/uploads/${vlu.userHomeModel!.messages!.status!.restaurantdata![int].primaryImage}",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  )
                                : Icon(
                                    Icons.image,
                                    size: 25,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    minVerticalPadding: 0,
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.green,
                                    ),
                                    title: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.none,
                                        child: vlu
                                                    .userHomeModel!
                                                    .messages!
                                                    .status!
                                                    .restaurantdata![int]
                                                    .restaurantName !=
                                                null
                                            ? Text(
                                                "${vlu.userHomeModel!.messages!.status!.restaurantdata![int].restaurantName}",
                                                overflow: TextOverflow.fade,
                                                maxLines: 3,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            : SizedBox(),
                                      ),
                                    ),
                                    trailing: InkWell(
                                        onTap: () {
                                          setState(() {
                                            category = !category;
                                            index = int;
                                          });
                                        },
                                        child: category && index == int
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.pinkAccent,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: Colors.black,
                                              )),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            "Pure Veg",
                                            // style:
                                            //     TextStyle(fontSize: 20, color: Colors.black),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text("16km"),
                                            SizedBox(
                                              height: 20,
                                              child: VerticalDivider(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.redAccent,
                                            ),
                                            FittedBox(child: Text("4.5")),
                                            Expanded(
                                              child: Text(
                                                "(4,200 ratings)",
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ))

                                //         // Row(
                                //         //   mainAxisAlignment: MainAxisAlignment.start,
                                //         //   crossAxisAlignment: CrossAxisAlignment.start,
                                //         //   children: [

                                //         //     Row(
                                //         //       mainAxisAlignment: MainAxisAlignment.center,
                                //         //       crossAxisAlignment: CrossAxisAlignment.center,
                                //         //       children: [
                                //         //         Padding(
                                //         //           padding: const EdgeInsets.only(
                                //         //             left: 5,
                                //         //           ),
                                //         //           child: Icon(
                                //         //             Icons.fiber_manual_record,
                                //         //             color: Colors.red,
                                //         //             size: 10,
                                //         //           ),
                                //         //         ),
                                //         //         Text("Pizza")
                                //         //       ],
                                //         //     ),
                                //         //     Row(
                                //         //       mainAxisAlignment: MainAxisAlignment.center,
                                //         //       crossAxisAlignment: CrossAxisAlignment.center,
                                //         //       children: [
                                //         //         Padding(
                                //         //           padding: const EdgeInsets.only(left: 5),
                                //         //           child: Icon(
                                //         //             Icons.fiber_manual_record,
                                //         //             color: Colors.red,
                                //         //             size: 10,
                                //         //           ),
                                //         //         ),
                                //         //         Text("Pasta")
                                //         //       ],
                                //         //     )
                                //         //   ],
                                //         // ),
                                //         // // ListTile(
                                //         //   contentPadding: EdgeInsets.zero,
                                //         //   minLeadingWidth: 0,
                                //         //   isThreeLine: true,
                                //         //   title:
                                //         //   subtitle:
                                //         // ),
                                //         // Text.rich(
                                //         //   TextSpan(
                                //         //     children: [
                                //         //       TextSpan(
                                //         //         text: '\u{20B9}',
                                //         //         style: TextStyle(
                                //         //             fontSize: 20,
                                //         //             fontWeight: FontWeight.bold,
                                //         //             color: Colors.black),
                                //         //       ),
                                //         //       TextSpan(
                                //         //         text: '20',
                                //         //         style: TextStyle(
                                //         //             fontSize: 20,
                                //         //             fontWeight: FontWeight.bold,
                                //         //             color: Colors.red),
                                //         //       ),
                                //         //     ],
                                //         //   ),
                                //         // )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
    });
  }
}
