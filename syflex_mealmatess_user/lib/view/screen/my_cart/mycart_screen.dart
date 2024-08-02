import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/orders/checkout-order_screen.dart';
import 'package:syflex_mealmatess_user/view/widget/mycart/mycart_iteam.dart';

import '../../../Provider_stateManegement/categoryProvider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  String? quantity;
  @override
  void initState() {
    // TODO: implement initState

    AllData();
    super.initState();
  }

  removItm({
    required product_id,
    required quantity,
    variation_id,
    required restaurant_id,
  }) async {
    int qty = int.parse(quantity);
    var provider = Provider.of<ViewUserProvider>(context, listen: false);
    // qty > 1 ? qty += 1 : qty;
    // await SyflexMealmatesRepository().addToCartProduct("71", "15", "1", "184");
    if (qty > 1) {
      provider.addToCartItem(
          product_id: product_id,
          qty: (qty - 1).toString(),
          variation_id: "1",
          restaurant_id: restaurant_id);
      AllData();
    } else {
      provider.addToCartItem(
          product_id: product_id,
          qty: "1",
          variation_id: "1",
          restaurant_id: restaurant_id);
      AllData();
    }
  }

  addItm({
    required product_id,
    required quantity,
    variation_id,
    required restaurant_id,
  }) async {
    int qty = int.parse(quantity);
    var provider = Provider.of<ViewUserProvider>(context, listen: false);
    // qty > 1 ? qty += 1 : qty;
    // await SyflexMealmatesRepository().addToCartProduct("71", "15", "1", "184");

    provider.addToCartItem(
        product_id: product_id,
        qty: (qty + 1).toString(),
        variation_id: "1",
        restaurant_id: restaurant_id);
    AllData();
    // quantity = qty.toString();
    // print(qty);
    // print(quantity);
  }

  AllData() {
    var provider = Provider.of<ViewUserProvider>(context, listen: false);
    provider.viewCartItem();

    // allcartItem = provider.viewCartItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "My Cart",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<ViewUserProvider>(builder: (context, val, chid) {
        return val.myCartModel != null
            ? RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 3), () {
                    AllData();
                  });
                  // setState(() {}); ///try this if the addition  order has not show the screen
                },
                color: Colors.black,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 0, bottom: 10),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: ListView.builder(
                            itemCount: val.myCartModel!.messages!.status!
                                .cartItems!.length,
                            itemBuilder: (coontext, int) {
                              // val.myCartModel!.messages!.status!
                              //     .cartItems![int].qty!.toString();
                              // quantity = val.myCartModel!.messages!.status!
                              //     .cartItems![int].qty!;

                              return Container(
                                height: 130,
                                margin: EdgeInsets.only(
                                    left: 3, right: 3, bottom: 5, top: 5),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.pinkAccent,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: CachedNetworkImageProvider(
                                                "https://mealking.in/uploads/${val.myCartModel!.messages!.status!.cartItems![int].primaryImage}"),
                                          )),
                                      // child: Image.network(
                                      //   ,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ListTile(
                                            // dense: true,
                                            // horizontalTitleGap: 3.0,
                                            // minVerticalPadding: 0,
                                            visualDensity: VisualDensity(
                                                horizontal: 0, vertical: -4),
                                            contentPadding: EdgeInsets.zero,
                                            leading: Icon(
                                              Icons.radio_button_checked,
                                              color: Colors.green,
                                            ),
                                            title: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                fit: BoxFit.none,
                                                child: Text(
                                                  "${val.myCartModel!.messages!.status!.cartItems![int].productName}",
                                                  maxLines: 2,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                            trailing: InkWell(
                                              onTap: () {
                                                var provider = Provider.of<
                                                        ViewUserProvider>(
                                                    context,
                                                    listen: false);
                                                provider.removeCartItem(
                                                    cart_item: provider
                                                        .myCartModel!
                                                        .messages!
                                                        .status!
                                                        .cartItems![int]
                                                        .cartId
                                                        .toString());
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                size: 24,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   crossAxisAlignment: CrossAxisAlignment.center,
                                          //   children: [
                                          //     Text("Farm Vila Pizza"),
                                          //     Icon(Icons.delete),
                                          //   ],
                                          // ),
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.start,
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.center,
                                          //     children: [
                                          //       FittedBox(
                                          //         child: Text(
                                          //           "2 Dishes",
                                          //           overflow: TextOverflow.fade,
                                          //           maxLines: 2,
                                          //           style: TextStyle(
                                          //               color: Colors.black54,
                                          //               fontSize: 15),
                                          //         ),
                                          //       ),
                                          //       SizedBox(
                                          //         width: 5,
                                          //       ),
                                          //       Expanded(
                                          //         child: Align(
                                          //           alignment: Alignment.centerLeft,
                                          //           child: FittedBox(
                                          //             fit: BoxFit.none,
                                          //             child: Text("Medium(9 inches)",
                                          //                 overflow: TextOverflow.fade,
                                          //                 softWrap: false,
                                          //                 maxLines: 2,
                                          //                 style: TextStyle(
                                          //                     color: Colors.black54,
                                          //                     fontSize: 15)),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text.rich(TextSpan(children: [
                                                    TextSpan(
                                                        text: "\u{20B9}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                    TextSpan(
                                                        text:
                                                            "${val.myCartModel!.messages!.status!.cartItems![int].salesPrice}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .pinkAccent,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ])),
                                                  Icon(
                                                    Icons.close,
                                                    size: 15,
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.none,
                                                    child: Text(
                                                        "${val.myCartModel!.messages!.status!.cartItems![int].qty}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .pinkAccent,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 70,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                        width: 16,
                                                        child: Center(
                                                          child: IconButton(
                                                              alignment: Alignment
                                                                  .center,
                                                              padding: EdgeInsets
                                                                  .zero,
                                                              iconSize: 15,
                                                              style: ButtonStyle(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(Colors
                                                                          .pinkAccent),
                                                                  shape: MaterialStateProperty.all(
                                                                      CircleBorder())),
                                                              onPressed: () => removItm(
                                                                  quantity: val
                                                                      .myCartModel!
                                                                      .messages!
                                                                      .status!
                                                                      .cartItems![
                                                                          int]
                                                                      .qty!,
                                                                  product_id: val
                                                                      .myCartModel!
                                                                      .messages!
                                                                      .status!
                                                                      .cartItems![int]
                                                                      .productId,
                                                                  variation_id: val.myCartModel!.messages!.status!.cartItems![int].variationId,
                                                                  restaurant_id: val.myCartModel!.messages!.status!.cartItems![int].vendorId),
                                                              icon: Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                        )),
                                                    // SizedBox(
                                                    //     height: 14,
                                                    //     // width: 5,
                                                    //     child: Text(
                                                    //       "${val.myCartModel!.messages!.status!.cartItems![int].qty!}",
                                                    //       style: TextStyle(
                                                    //           color:
                                                    //               Colors.black,
                                                    //           fontSize: 14),
                                                    //     )),
                                                    SizedBox(
                                                        width: 16,
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            iconSize: 15,
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all(Colors
                                                                        .pinkAccent),
                                                                shape: MaterialStateProperty.all(
                                                                    CircleBorder())),
                                                            onPressed: () => addItm(
                                                                quantity: val
                                                                    .myCartModel!
                                                                    .messages!
                                                                    .status!
                                                                    .cartItems![
                                                                        int]
                                                                    .qty!,
                                                                product_id: val
                                                                    .myCartModel!
                                                                    .messages!
                                                                    .status!
                                                                    .cartItems![
                                                                        int]
                                                                    .productId,
                                                                variation_id: val.myCartModel!.messages!.status!.cartItems![int].variationId,
                                                                restaurant_id: val.myCartModel!.messages!.status!.cartItems![int].vendorId),
                                                            icon: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            )))
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                              // val
                              //     .myCartModel!.messages!.status!.cartItems![int]
                              //     .toJson()
                            }),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      alignment: Alignment.center,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.pinkAccent),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)))),
                                  onPressed: () {
                                    if (val.myCartModel!.messages!.status!
                                            .cartItems!.length !=
                                        0) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CheckOutOrderScreen(
                                                      cartItem: val
                                                          .myCartModel!
                                                          .messages!
                                                          .status!
                                                          .cartItems!)));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "First Add items then yu go next screen",
                                        style: TextStyle(color: Colors.red),
                                      )));
                                    }
                                  },
                                  child: Text("Place order",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)))))
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
