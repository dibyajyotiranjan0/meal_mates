import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/bottom_nav/bottom_navigation_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/discount/discount_code_screen.dart';
import 'package:syflex_mealmatess_user/view/widget/checkoutorder/deliver_1st_widget.dart';

import '../../../api/model/mycart_model.dart';
import '../../widget/mycart/mycart_iteam.dart';
import '../Home/home_page_screen.dart';

class CheckOutOrderScreen extends StatefulWidget {
  List<CartItems> cartItem;
  //
  CheckOutOrderScreen({required this.cartItem, super.key});

  @override
  State<CheckOutOrderScreen> createState() => _CheckOutOrderScreenState();
}

class _CheckOutOrderScreenState extends State<CheckOutOrderScreen> {
  String? addressIdUser;
  String? cuponCde;
  // Map? copon;
  @override
  void initState() {
    address();
    // TODO: implement initState
    super.initState();
  }

  address() async {
    final provider = Provider.of<CheckoutOrderProvider>(context, listen: false);
    await provider.cuponCodeShows(cartItem: widget.cartItem);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var defailtAddressDataa =
        await jsonDecode(prefs.getString('address').toString());
    if (defailtAddressDataa != null && defailtAddressDataa.isNotEmpty) {
      addressIdUser = defailtAddressDataa["address_id"];
    }

    //Corect for fetcch address id
    // print(widget.cartItem[0].toJson());

    setState(() {});
  }

  checkOutOrder(
      {required cupon_code,
      required cupon_price,
      required paymentmode,
      required total,
      required addres}) async {
    // await SyflexMealmatesRepository().checkOutOrder(
    //     cupon_code: cupon_code,
    //     cupon_price: cupon_price,
    //     paymentmode: paymentmode,
    //     address_id: addres);
    print("${addres},${total},${cupon_code},${cupon_price}");
    if (addres != "" && total > 0) {
      final provider =
          Provider.of<CheckoutOrderProvider>(context, listen: false);
      await provider
          .checkOutOrderProvider(
              address_id: addres,
              cuponCode: cupon_code,
              cuponPrice: cupon_price,
              paymentMode: paymentmode)
          .then((e) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Bottom_NavScreen(
                        index: 2,
                      ))));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Enter Address first",
        style: TextStyle(color: Colors.red),
      )));
    }
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
          "Checkout Order",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Deliver1stWidget(
              cartItem: widget.cartItem,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Orders Summary",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                ListView.builder(
                    itemCount: widget.cartItem.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, int) {
                      return MyCartIteams(
                        item: widget.cartItem[int],
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      dense: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bottom_NavScreen(
                                      index: 0,
                                    )));
                      },
                      // SyflexMealmatesRepository()
                      //     .HomePage_Open(
                      //         //value["messages"]["status"]["user_id"].toString()
                      //         )
                      //     .then((val) => Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Bottom_NavScreen(
                      //                   index: 2,
                      //                 )))),
                      // isThreeLine: true,
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      tileColor: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      leading: Icon(Icons.add_circle),
                      title: SizedBox(
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: Text(
                            'Add More Iteams',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // subtitle: Text(""),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiscountCodeScreen(
                                      cartItem: widget.cartItem,
                                    )));
                      },
                      dense: true,
                      // isThreeLine: true,
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      tileColor: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: Icon(Icons.percent_outlined),
                      title: Expanded(
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FittedBox(
                                child: Text(
                                  'Get Discount',
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Consumer<CheckoutOrderProvider>(
                                  builder: (context, val, child) {
                                return val.CuponCode != null &&
                                        val.CuponCode!.isNotEmpty
                                    ? SizedBox(
                                        width: 70,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.only(
                                                    left: 7, right: 7)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.pinkAccent),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: val.CuponCode != null &&
                                                        val.CuponCode!
                                                            .isNotEmpty
                                                    ? FittedBox(
                                                        fit: BoxFit.fill,
                                                        child: Text(
                                                          "${val.CuponCode!["cupon_price"].toString()} \u{20B9}  ",
                                                          overflow:
                                                              TextOverflow.fade,
                                                          maxLines: 2,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  final provider = Provider.of<
                                                          CheckoutOrderProvider>(
                                                      context,
                                                      listen: false);
                                                  provider.CuponCodeStore({},
                                                      cartItem:
                                                          widget.cartItem);
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  size: 17,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox();
                              }),
                            ],
                          ),
                        ),
                      ),
                      // subtitle: Text(""),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery Instructions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 130,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              Text(
                                "Avoid Ringing bell",
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 3, right: 3, bottom: 20, top: 20),
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
              child: Consumer<CheckoutOrderProvider>(
                  builder: (context, val, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text("\u{20B9}${val.cartItemPrice}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Delivery Fee"),
                        Text("\u{20B9}${val.deliveryFee}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text("\u{20B9}${val.discountPrice}")
                      ],
                    ),
                    Divider(
                      color: Colors.black26,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Total"),
                            Text("\u{20B9}${val.total}")
                          ],
                        )
                      ],
                    )
                  ],
                );
              }),
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: Consumer<CheckoutOrderProvider>(
                    builder: (context, va, child) {
                  return ElevatedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pinkAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      // onPressed: ()=>

                      // },
                      onPressed: () => va.cloading
                          ? null
                          : checkOutOrder(
                              cupon_code: va.CuponCode != null &&
                                      va.CuponCode!.isNotEmpty
                                  ? va.CuponCode!["cupon_code"]
                                  : "",
                              cupon_price: va.discountPrice.toString(),
                              paymentmode: "",
                              total: va.total,
                              addres: va.addressIdUserprovider != null
                                  ? va.addressIdUserprovider
                                  : addressIdUser != null
                                      ? addressIdUser
                                      : ""),
                      child: va.cloading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text("CheckOut order",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)));
                }))
          ],
        ),
      ),
    );
  }
}
