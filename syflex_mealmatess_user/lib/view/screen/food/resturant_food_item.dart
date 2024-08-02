import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/view/screen/my_cart/mycart_screen.dart';
import 'package:syflex_mealmatess_user/view/widget/foods/addto_cart_food_iteams.dart';
import 'package:syflex_mealmatess_user/view/widget/foods/search_foods_item_textfield.dart';

import '../../../Provider_stateManegement/categoryProvider.dart';
import '../../../Provider_stateManegement/food_product_provider.dart';

class singleResturantFoodItems extends StatefulWidget {
  String resurant_id;
  singleResturantFoodItems({required this.resurant_id, super.key});

  @override
  State<singleResturantFoodItems> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<singleResturantFoodItems> {
  int quenty = 1;
  bool cloading = false;
  @override
  void initState() {
    // TODO: implement initState
    allFoodItems();
    super.initState();
  }

  allFoodItems() {
    final provider = Provider.of<FoodItemProvider>(context, listen: false);
    provider.singleResturantFoodItems(restaurant_id: widget.resurant_id);
  }

  Future openAddToCart(Map item) {
    // int quenty = 1;
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
                          // isDismis = true;
                          setState(() {
                            quenty = 1;
                          });
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
                                          print(cloading);
                                          provider
                                              .addToCartItem(
                                                  product_id:
                                                      item["product_id"],
                                                  qty: quenty.toString(),
                                                  variation_id: "1",
                                                  restaurant_id:
                                                      item["vendor_id"])
                                              .then((v) {
                                            print(cloading);
                                            setState(() {
                                              cloading = false;
                                              quenty = 1;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                              "Product Aded your cart Sucessfully",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )));
                                            Navigator.pop(context);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 35,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Category Wise Resturant Food",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Consumer<FoodItemProvider>(builder: (context, value, child) {
          return value.singeResturantFoodItem != null
              ? RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 3), () {
                      allFoodItems();
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
                            itemCount: value.singeResturantFoodItem!.messages!
                                .status!.restaurantProductData!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.7,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 2),
                            itemBuilder: (context, int) {
                              return LayoutBuilder(
                                  builder: (context, Constraints) {
                                // print(value
                                //     .singeResturantFoodItem!
                                //     .messages!
                                //     .status!
                                //     .restaurantProductData![int]
                                //     .productName);
                                // return SizedBox();

                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: Constraints.maxHeight * 0.5,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Image.network(
                                          "https://mealking.in/uploads/${value.singeResturantFoodItem!.messages!.status!.restaurantProductData![int].primaryImage}",
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
                                                                        .singeResturantFoodItem!
                                                                        .messages!
                                                                        .status!
                                                                        .restaurantProductData![
                                                                            int]
                                                                        .foodType ==
                                                                    "0"
                                                                ? Colors.green
                                                                : Colors
                                                                    .pinkAccent)),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons
                                                            .fiber_manual_record,
                                                        size: 16,
                                                        color: value
                                                                    .singeResturantFoodItem!
                                                                    .messages!
                                                                    .status!
                                                                    .restaurantProductData![
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
                                                                .singeResturantFoodItem!
                                                                .messages!
                                                                .status!
                                                                .restaurantProductData![
                                                                    int]
                                                                .productName !=
                                                            null
                                                        ? value
                                                                    .singeResturantFoodItem!
                                                                    .messages!
                                                                    .status!
                                                                    .restaurantProductData![
                                                                        int]
                                                                    .productName!
                                                                    .length >
                                                                15
                                                            ? value
                                                                .singeResturantFoodItem!
                                                                .messages!
                                                                .status!
                                                                .restaurantProductData![
                                                                    int]
                                                                .productName!
                                                                .substring(
                                                                    0, 15)
                                                            : value
                                                                .singeResturantFoodItem!
                                                                .messages!
                                                                .status!
                                                                .restaurantProductData![
                                                                    int]
                                                                .productName!
                                                        : "",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FittedBox(
                                              fit: BoxFit.none,
                                              child: Text(
                                                value
                                                            .singeResturantFoodItem!
                                                            .messages!
                                                            .status!
                                                            .restaurantProductData![
                                                                int]
                                                            .productName !=
                                                        null
                                                    ? value
                                                        .singeResturantFoodItem!
                                                        .messages!
                                                        .status!
                                                        .restaurantProductData![
                                                            int]
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
                                                    "\u{20B9}${value.singeResturantFoodItem!.messages!.status!.restaurantProductData![int].salesPrice != null ? value.singeResturantFoodItem!.messages!.status!.restaurantProductData![int].salesPrice.toString() : ""}")
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
                                                  .singeResturantFoodItem!
                                                  .messages!
                                                  .status!
                                                  .restaurantProductData![int]
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
                                //       child:
                                //           VerticalDivider(color: Colors.white),
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
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
        }),
      ),
    );
  }
}
