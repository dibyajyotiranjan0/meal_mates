import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/view/screen/my_cart/mycart_screen.dart';

import '../../../Provider_stateManegement/categoryProvider.dart';

class FoodItem_AddtoCart extends StatefulWidget {
  String cat_id;
  FoodItem_AddtoCart({required this.cat_id, super.key});

  @override
  State<FoodItem_AddtoCart> createState() => _FoodItem_AddtoCartState();
}

class _FoodItem_AddtoCartState extends State<FoodItem_AddtoCart> {
  int quenty = 1;
  bool cloading = false;
  @override
  void initState() {
    // TODO: implement initState
    var provider = Provider.of<ViewUserProvider>(context, listen: false);
    provider.categoryProvider(widget.cat_id);
    super.initState();
  }

  AllData() {
    var provider = Provider.of<ViewUserProvider>(context, listen: false);
    provider.categoryProvider(widget.cat_id);
  }

  Future openAddToCart(Map item) {
    //int quenty = 1;
    return showModalBottomSheet<void>(
      isDismissible: false,
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text

        // Returning SizedBox instead of a Container
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          var provider = Provider.of<ViewUserProvider>(context, listen: false);
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.grey.shade200,
            margin: EdgeInsets.only(bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 1,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  color: Colors.greenAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 18,
                              width: 20,
                              alignment: Alignment.center,
                              //padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pinkAccent)),
                              child: Center(
                                child: Icon(
                                  Icons.fiber_manual_record,
                                  size: 16,
                                  color: item["food_type"] == "0"
                                      ? Colors.green
                                      : Colors.pinkAccent,
                                ),
                              )),
                          Text(
                            item["product_name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          quenty = 1;
                          // isDismis = true;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 20, right: 20),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Varients",
                    //         style: TextStyle(
                    //             decoration: TextDecoration.underline,
                    //             decorationStyle: TextDecorationStyle.dashed,
                    //             decorationColor: Colors.black,
                    //             decorationThickness: 2),
                    //       ),
                    //       SizedBox(
                    //         height: 50,
                    //         width: MediaQuery.of(context).size.width * 1,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Text("Quarter"),
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(right: 10),
                    //                   child: Text("\u{20B9}${200}"),
                    //                 ),
                    //                 Container(
                    //                     height: 100,
                    //                     decoration: BoxDecoration(
                    //                         boxShadow: [
                    //                           BoxShadow(
                    //                             offset: Offset(0, 1),
                    //                             blurRadius: 5,
                    //                             color: Colors.black
                    //                                 .withOpacity(0.3),
                    //                           ),
                    //                         ],
                    //                         color: Colors.white,
                    //                         borderRadius:
                    //                             BorderRadius.circular(10)),
                    //                     child: Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.spaceBetween,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         children: [
                    //                           IconButton(
                    //                               onPressed: () {
                    //                                 setState(() {
                    //                                   quenty -= 1;
                    //                                 });
                    //                               },
                    //                               icon: Icon(Icons.remove)),
                    //                           Text("${quenty}"),
                    //                           IconButton(
                    //                               onPressed: () {
                    //                                 quenty += 1;
                    //                                 setState(() {});
                    //                               },
                    //                               icon: Icon(Icons.add))
                    //                         ]))
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Divider(
                    //   color: Colors.black12,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Quantity"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("\u{20B9}${item["sales_price"]}"),
                                ),
                                Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  quenty > 1
                                                      ? quenty -= 1
                                                      : quenty;
                                                });
                                              },
                                              icon: Icon(Icons.remove)),
                                          Text("${quenty}"),
                                          IconButton(
                                              onPressed: () {
                                                quenty += 1;
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.add))
                                        ]))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black12,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\u{20B9} ${quenty * int.parse(item["sales_price"])}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 180,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: cloading
                                      ? null
                                      : () {
                                          setState(() {
                                            cloading = true;
                                          });
                                          provider
                                              .addToCartItem(
                                                  product_id:
                                                      item["product_id"],
                                                  qty: quenty.toString(),
                                                  variation_id: "1",
                                                  restaurant_id:
                                                      item["vendor_id"])
                                              .then((v) {
                                            quenty = 1;
                                            cloading = false;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                              "Product Aded your cart Sucessfully",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )));
                                            Navigator.pop(context);
                                            setState(() {});
                                          });
                                          //  Navigator.pop(context);
                                        },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  child: cloading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text("Add to Cart")),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewUserProvider>(builder: (context, value, child) {
      return value.categoryModel != null
          ? RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 3), () {
                  AllData();
                });
                // setState(() {}); ///try this if the addition  order has not show the screen
              },
              color: Colors.black,
              backgroundColor: Colors.white,
              child: Stack(
                fit: StackFit.loose,
                //fit: StackFit.expand,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.88,
                    //width: 300,
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 100),
                        //physics: AlwaysScrollableScrollPhysics(),
                        //scrollDirection: Axis.vertical,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: value.categoryModel!.messages!.status!
                            .catProductData!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.7,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2),
                        itemBuilder: (context, int) {
                          return LayoutBuilder(builder: (context, Constraints) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Constraints.maxHeight * 0.5,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Image.network(
                                      "https://collegeprojectz.com/mealmate/uploads/${value.categoryModel!.messages!.status!.catProductData![int].primaryImage}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Constraints.maxHeight * 0.3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 18,
                                                width: 18,
                                                alignment: Alignment.center,
                                                //padding: EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: value
                                                                    .categoryModel!
                                                                    .messages!
                                                                    .status!
                                                                    .catProductData![
                                                                        int]
                                                                    .foodType ==
                                                                "0"
                                                            ? Colors.green
                                                            : Colors
                                                                .pinkAccent)),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.fiber_manual_record,
                                                    size: 16,
                                                    color: value
                                                                .categoryModel!
                                                                .messages!
                                                                .status!
                                                                .catProductData![
                                                                    int]
                                                                .foodType ==
                                                            "0"
                                                        ? Colors.green
                                                        : Colors.redAccent,
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            FittedBox(
                                              fit: BoxFit.none,
                                              child: Text(
                                                value
                                                            .categoryModel!
                                                            .messages!
                                                            .status!
                                                            .catProductData![
                                                                int]
                                                            .productName !=
                                                        null
                                                    ? value
                                                                .categoryModel!
                                                                .messages!
                                                                .status!
                                                                .catProductData![
                                                                    int]
                                                                .productName!
                                                                .length >
                                                            15
                                                        ? value
                                                            .categoryModel!
                                                            .messages!
                                                            .status!
                                                            .catProductData![
                                                                int]
                                                            .productName!
                                                            .substring(0, 15)
                                                        : value
                                                            .categoryModel!
                                                            .messages!
                                                            .status!
                                                            .catProductData![
                                                                int]
                                                            .productName!
                                                    : "",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        FittedBox(
                                          fit: BoxFit.none,
                                          child: Text(
                                            value
                                                        .categoryModel!
                                                        .messages!
                                                        .status!
                                                        .catProductData![int]
                                                        .productName !=
                                                    null
                                                ? value
                                                    .categoryModel!
                                                    .messages!
                                                    .status!
                                                    .catProductData![int]
                                                    .productName
                                                    .toString()
                                                : "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.pinkAccent,
                                              size: 14,
                                            ),
                                            Text("5.0"),
                                            VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            Text(
                                                "\u{20B9}${value.categoryModel!.messages!.status!.catProductData![int].salesPrice != null ? value.categoryModel!.messages!.status!.catProductData![int].salesPrice.toString() : ""}")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Constraints.maxHeight * 0.15,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          openAddToCart(value
                                              .categoryModel!
                                              .messages!
                                              .status!
                                              .catProductData![int]
                                              .toJson());
                                        },
                                        child: Center(
                                          child: Text(
                                            "ADD",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  side: BorderSide(
                                                      color: Colors
                                                          .grey.shade500))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            );
                          });
                        }),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      //top: MediaQuery.of(context).size.height * 0.8,
                      child: Container(
                        height: 70,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        color: Colors.black38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "\u{20B9}${200}",
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     SizedBox(
                            //       height: 40,
                            //       child: VerticalDivider(color: Colors.white),
                            //     ),
                            //     Text("1 item",
                            //         style: TextStyle(
                            //             color: Colors.white, fontSize: 14))
                            //   ],
                            // ),
                            TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyCartScreen()));
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                icon: Icon(
                                  Icons.local_mall_outlined,
                                  color: Colors.green,
                                ),
                                label: Text("View cart",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),
                      )),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
