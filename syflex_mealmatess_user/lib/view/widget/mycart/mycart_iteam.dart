import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../api/model/mycart_model.dart';

class MyCartIteams extends StatefulWidget {
  CartItems? item;
  MyCartIteams({required this.item, super.key});

  @override
  State<MyCartIteams> createState() => _MyCartIteamsState();
}

class _MyCartIteamsState extends State<MyCartIteams> {
  int value = 0;
  int? index_num;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                color: Colors.pinkAccent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://collegeprojectz.com/mealmate/uploads/${widget.item!.primaryImage}"))),

            // child: Image.network(widget.item.primaryImage),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    // dense: true,
                    // horizontalTitleGap: 3.0,
                    // minVerticalPadding: 0,
                    // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    contentPadding: EdgeInsets.zero,
                    // leading: Icon(
                    //   Icons.radio_button_checked,
                    //   color: Colors.green,
                    // ),
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.green,
                          ),
                          widget.item!.productName != null
                              ? FittedBox(
                                  fit: BoxFit.none,
                                  child: Text(
                                    widget.item!.productName!.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              : SizedBox(),
                        ],
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
                // Expanded(
                //   flex: 2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       FittedBox(
                //         child: Text(
                //           "2 Dishes",
                //           overflow: TextOverflow.fade,
                //           maxLines: 2,
                //           style: TextStyle(color: Colors.black54, fontSize: 15),
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
                //                     color: Colors.black54, fontSize: 15)),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          text: "${widget.item!.salesPrice!}",
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ])),
                    Icon(
                      Icons.close,
                      size: 15,
                    ),
                    Text(
                      "${widget.item!.qty}",
                      style: TextStyle(color: Colors.pinkAccent),
                    )
                    // SizedBox(
                    //   width: 70,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       SizedBox(
                    //           width: 16,
                    //           child: Center(
                    //             child: IconButton(
                    //                 alignment: Alignment.center,
                    //                 padding: EdgeInsets.zero,
                    //                 iconSize: 15,
                    //                 style: ButtonStyle(
                    //                     alignment: Alignment.center,
                    //                     backgroundColor:
                    //                         MaterialStateProperty.all(
                    //                             Colors.pinkAccent),
                    //                     shape: MaterialStateProperty.all(
                    //                         CircleBorder())),
                    //                 onPressed: () {
                    //                   setState(() {
                    //                     value -= 1;
                    //                   });
                    //                 },
                    //                 icon: Icon(
                    //                   Icons.remove,
                    //                   color: Colors.white,
                    //                 )),
                    //           )),
                    //       SizedBox(
                    //           height: 14,
                    //           // width: 5,
                    //           child: Text(
                    //             value.toString(),
                    //             style: TextStyle(
                    //                 color: Colors.black, fontSize: 14),
                    //           )),
                    //       SizedBox(
                    //           width: 16,
                    //           child: IconButton(
                    //               padding: EdgeInsets.zero,
                    //               iconSize: 15,
                    //               style: ButtonStyle(
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(
                    //                           Colors.pinkAccent),
                    //                   shape: MaterialStateProperty.all(
                    //                       CircleBorder())),
                    //               onPressed: () {
                    //                 setState(() {
                    //                   value += 1;
                    //                 });
                    //               },
                    //               icon: Icon(
                    //                 Icons.add,
                    //                 color: Colors.white,
                    //               )))
                    //     ],
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
