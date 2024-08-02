import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/view/widget/orders/product_Widget.dart';

import '../../../Provider_stateManegement/categoryProvider.dart';

class ActiveOrderScreen extends StatefulWidget {
  const ActiveOrderScreen({super.key});

  @override
  State<ActiveOrderScreen> createState() => _ActiveOrderScreenState();
}

class _ActiveOrderScreenState extends State<ActiveOrderScreen> {
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          // Container(
          //     height: 50,
          //     margin: EdgeInsets.only(top: 5, bottom: 10),
          //     width: double.infinity,
          //     child: TextField(
          //   autocorrect: true,
          //   maxLines: 1,
          //   controller: _search,
          //   keyboardType: TextInputType.text,
          //   style: TextStyle(color: Colors.black),
          //   decoration: InputDecoration(
          //       // label: Text("Contact No"),
          //       // floatingLabelBehavior: FloatingLabelBehavior.always,
          //       // floatingLabelStyle: TextStyle(),
          //       hintText: "Search Rersturant & dishes",
          //       prefixIcon: Icon(
          //         Icons.search,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       hintStyle: TextStyle(
          //         color: Colors.black26,
          //       ),
          //       contentPadding: EdgeInsets.only(
          //         left: 25,
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               const BorderSide(color: Colors.grey, width: 2.0),
          //           borderRadius: BorderRadius.circular(10)),
          //       enabledBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey),
          //           borderRadius: BorderRadius.circular(10)),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(
          //               color: Colors.grey,
          //               width: 2.0,
          //               style: BorderStyle.solid))),
          // )),
          Expanded(child: ProductWidgtOf_Order())
        ],
      ),
    );
  }
}
