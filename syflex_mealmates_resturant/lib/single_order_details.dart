// import 'dart:ffi';

import 'package:flutter/material.dart';

class VerifyOrder_item_single extends StatefulWidget {
  Map<String, dynamic> product;
  VerifyOrder_item_single({required this.product, super.key});

  @override
  State<VerifyOrder_item_single> createState() =>
      _VerifyOrder_item_singleState();
}

class _VerifyOrder_item_singleState extends State<VerifyOrder_item_single> {
  bool _enable = false;
  String valu = "Not Available";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(left: 3, right: 3, bottom: 5, top: 5),
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
                borderRadius: BorderRadius.circular(20),
                color: Colors.pinkAccent),
            child: Image.asset("assets/logo/mealmates.png"),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    dense: true,
                    minLeadingWidth: 10,
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
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
                          widget.product["productname"],
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "${widget.product["qty"]} Dish",
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Text("Medium(9 inches)",
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 15)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "\u{20B9}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: "${widget.product["price"]}",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ])),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
