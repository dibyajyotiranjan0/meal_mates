import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/api/model/mycart_model.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/orders/checkout-order_screen.dart';

class DiscountCodeScreen extends StatefulWidget {
  List<CartItems> cartItem;
  DiscountCodeScreen({required this.cartItem, super.key});

  @override
  State<DiscountCodeScreen> createState() => _DiscountCodeScreenState();
}

class _DiscountCodeScreenState extends State<DiscountCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController coupon = TextEditingController();
  String? message;
  Map? coupon_codes;
  Color color = Colors.red;
  bool cuponValid = false;
  // validator(value) {
  //   if (value.isEmpty) {
  //     // SyflexMealmatesRepository().applyCoupon(coupon.text.toString());

  //     return "Invalid Coupon";
  //   } else if (value) {
  //     return "";
  //   } else {
  //     return null;
  //   }
  // }

  checkCoupnValidate() {}

  formSubmit() {
    SyflexMealmatesRepository().applyCoupon(coupon.text.toString()).then((e) {
      if (e["messages"]["responsecode"] == "01") {
        color = Colors.green;
        message = "${e["messages"]["status"]["cupon_price"]} price off";
        coupon_codes = e["messages"]["status"];

        cuponValid = true;
      } else if (e["messages"]["responsecode"] == "00") {
        message = "Invalid Coupon Code";
      } else {}
      setState(() {});
      // if(e["messages"]["status"] ==)
      // print(e["messages"]["status"]["cupon_code"]);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    formSubmit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: Text(
          "Enter Discount Code",
          style: TextStyle(fontSize: 26, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Enter Discount Code",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: coupon,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                onEditingComplete: formSubmit(),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.only(bottom: 5, left: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                            style: BorderStyle.solid))),
              ),
            ),
            // message != null
            //     ?
            Text(
              "${message ?? ""}",
              style: TextStyle(color: color),
            ),
            // : Text(""),
            SizedBox(
              height: 20,
            ),
            cuponValid
                ? SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        onPressed: () {
                          final provider = Provider.of<CheckoutOrderProvider>(
                              context,
                              listen: false);
                          provider.CuponCodeStore(coupon_codes,
                              cartItem: widget.cartItem);
                          Navigator.pop(context);
                        },
                        child: Text("Apply Now",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
