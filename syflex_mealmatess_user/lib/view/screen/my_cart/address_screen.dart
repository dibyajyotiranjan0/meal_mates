import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/api/model/all_address-model.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/my_cart/select_delivery_location.dart';
import 'package:syflex_mealmatess_user/view/screen/my_cart/uppdate_addrress.dart';

import '../../../Provider_stateManegement/categoryProvider.dart';
import '../../../Provider_stateManegement/food_product_provider.dart';
import '../../../api/model/mycart_model.dart';
import '../orders/checkout-order_screen.dart';
import 'Add_new_address.dart';

class AddressScreen_order extends StatefulWidget {
  List<CartItems> cartItem;
  AddressScreen_order({required this.cartItem, super.key});

  @override
  State<AddressScreen_order> createState() => _AddressScreen_orderState();
}

class _AddressScreen_orderState extends State<AddressScreen_order> {
  var default_tag = "Home";

  @override
  void initState() {
    // TODO: implement initState

    allAddress();
    super.initState();
  }

  allAddress() {
    var provider = Provider.of<CheckoutOrderProvider>(context,
        listen: false); //CheckoutOrderProvider
    provider.allAddress();
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
          "Address",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<CheckoutOrderProvider>(builder: (context, val, child) {
        //CheckoutOrderProvider
        return Stack(
          fit: StackFit.expand,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: val.allAddressModel != null
                  ? RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(Duration(seconds: 3), () {
                          allAddress();
                        });
                        // setState(() {}); ///try this if the addition  order has not show the screen
                      },
                      color: Colors.black,
                      backgroundColor: Colors.white,
                      child: ListView.builder(
                          itemCount: val.allAddressModel!.messages!.status!
                              .addressData!.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Material(
                                elevation: 5,
                                shadowColor: Colors.black,
                                child: ListTile(
                                  tileColor: Colors.white,
                                  isThreeLine: true,
                                  visualDensity: VisualDensity(
                                      horizontal: 3, vertical: -4),
                                  onTap: () async {
                                    // await SyflexMealmatesRepository().stooredefaultAddress(address)
                                    final provider =
                                        Provider.of<CheckoutOrderProvider>(
                                            context,
                                            listen: false);
                                    provider.addressDetails(
                                        val.allAddressModel!.messages!.status!
                                            .addressData![index],
                                        cartItem: widget.cartItem);
                                    Navigator.pop(context);
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: ((context) =>
                                    //             CheckOutOrderScreen(
                                    //               cartItem: widget.cartItem,
                                    //             ))));
                                    // print(prefs.getString("address"));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // leading: CircleAvatar(
                                  //   radius: 20,
                                  //   backgroundImage:
                                  //       AssetImage("assets/logo/mealmates.png"),
                                  // ),
                                  title: Row(
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.none,
                                        child: Text(
                                          "${val.allAddressModel!.messages!.status!.addressData![index].firstName ?? ""} ${val.allAddressModel!.messages!.status!.addressData![index].lastName ?? ""}",
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
                                      // address[index]["adresName"] == default_tag
                                      //     ? Container(
                                      //         color: Colors.pink.withOpacity(0.2),
                                      //         child: Text(
                                      //           "Default",
                                      //           style: TextStyle(
                                      //               fontSize: 14,
                                      //               color: Colors.pinkAccent),
                                      //         ),
                                      //       )
                                      //     : SizedBox()
                                    ],
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${val.allAddressModel!.messages!.status!.addressData![index].state ?? ""},${val.allAddressModel!.messages!.status!.addressData![index].cityname ?? ""},${val.allAddressModel!.messages!.status!.addressData![index].cityname ?? ""},${val.allAddressModel!.messages!.status!.addressData![index].pincode ?? ""}${val.allAddressModel!.messages!.status!.addressData![index].address1 ?? ""} ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Address1: ${val.allAddressModel!.messages!.status!.addressData![index].address1 ?? ""} ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Address2: ${val.allAddressModel!.messages!.status!.addressData![index].adress2 ?? ""} ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  trailing: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdateAddress(
                                                  address: val
                                                      .allAddressModel!
                                                      .messages!
                                                      .status!
                                                      .addressData![index]
                                                      .toJson(),
                                                ))),
                                    child: Icon(
                                      Icons.border_color_outlined,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pinkAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewAdress()));
                      },
                      child: Text("Add New Address",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
            )
          ],
        );
      }),
    );
  }
}
