import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/provider/restturantProductProvider.dart';
import 'package:syflex_mealmates_resturant/provider/resturant-product_provider.dart';

class PruductMenu_single extends StatefulWidget {
  String product_id;
  Map? product;
  // Function(String value) updateState;
  PruductMenu_single({this.product, required this.product_id, super.key});

  @override
  State<PruductMenu_single> createState() => _PruductMenu_singleState();
}

class _PruductMenu_singleState extends State<PruductMenu_single> {
  // late bool _enable = widget.product_item!["status"] == "0" ? true : false;
  // late String valu = _enable ? "Available" : "Not Available";
  @override
  void initState() {
    // TODO: implement initState
    print(widget.product_id);
    // final provider =
    //     Provider.of<ResturantproductProvider>(context, listen: false);
    // provider.getSingleproduct(widget.product_id);
    // super.initState();
  }

  productStsUpdate(id, status) async {
    var provider =
        Provider.of<ResturantproductProvider>(context, listen: false);
    await provider.getSingleProductStsUpdate(id, status);
    //await SyflexMealmatesRepository().ProductStatusUpdate(id, status);
    //widget.updateState("update the states");
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ResturatProductListProvider>(context);
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
      child: Consumer<ResturantproductProvider>(builder: (context, val, child) {
        // print(val.singleProduct!.messages!.status!.productDtls![0].productId ==
        //         "71"
        //     ? true
        //     : false);
        return Row(
          children: [
            Text(val.singleProduct == null
                ? widget.product!["product_name"]
                : val.singleProduct!.messages!.status!.productDtls![0]
                    .productName),
            SizedBox(
                width: 70,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 40,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            inactiveTrackColor: Colors.red,
                            inactiveThumbColor: Colors.white,
                            value: val.singleProduct == null
                                ? widget.product!["status"] == "0"
                                    ? true
                                    : false
                                : val.singleProduct!.messages!.status!
                                            .productDtls![0].status ==
                                        "0"
                                    ? true
                                    : false,
                            onChanged: (bool val) => productStsUpdate(
                                widget.product!["product_id"],
                                widget.product!["status"] == "0" ? "1" : "0"),
                          ),
                        ),
                      ),
                    ]))
          ],
        );
      }),
      // child: Consumer<ResturantproductProvider>(builder: (context, val, child) {
      //   print(val.singleProduct!.toJson());
      //   return val.singleProduct == null
      //       ? Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             val.singleProduct!.messages!.status!.productDtls?[0]
      //                         .primaryImage ==
      //                     null
      //                 ? Icon(
      //                     Icons.image_outlined,
      //                     size: 100,
      //                   )
      //                 : Container(
      //                     height: 100,
      //                     width: 100,
      //                     margin: EdgeInsets.only(right: 10),
      //                     padding: EdgeInsets.all(4),
      //                     decoration: BoxDecoration(
      //                         image: DecorationImage(
      //                             fit: BoxFit.cover,
      //                             image: NetworkImage(
      //                                 "https://collegeprojectz.com/mealmate/uploads/${val.singleProduct!.messages!.status!.productDtls?[0].primaryImage}")),
      //                         borderRadius: BorderRadius.circular(20),
      //                         color: Colors.pinkAccent),
      //                     // child: Image.network(
      //                     //   "https://collegeprojectz.com/mealmate/uploads/${widget.product_item!["primary_image"]}",
      //                     //   fit: BoxFit.fill,
      //                     // ),
      //                   ),
      //             Expanded(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(
      //                     child: ListTile(
      //                       dense: true,
      //                       selected: true,
      //                       selectedColor: Colors.blue,
      //                       minLeadingWidth: 10,
      //                       horizontalTitleGap: 0,
      //                       minVerticalPadding: 0,
      //                       visualDensity:
      //                           VisualDensity(horizontal: 0, vertical: -4),
      //                       contentPadding: EdgeInsets.zero,
      //                       leading: FittedBox(
      //                         child: Icon(
      //                           Icons.radio_button_checked,
      //                           color: val.singleProduct!.messages!.status!
      //                                       .productDtls?[0].foodType ==
      //                                   "1"
      //                               ? Colors.green
      //                               : Colors.red,
      //                         ),
      //                       ),
      //                       title: Align(
      //                         alignment: Alignment.centerLeft,
      //                         child: FittedBox(
      //                           fit: BoxFit.contain,
      //                           child: Text(
      //                             val
      //                                         .singleProduct!
      //                                         .messages!
      //                                         .status!
      //                                         .productDtls![0]
      //                                         .productName!
      //                                         .length >
      //                                     24
      //                                 ? ("${val.singleProduct!.messages!.status!.productDtls?[0].productName}")
      //                                     .substring(0, 24)
      //                                 : "${val.singleProduct!.messages!.status!.productDtls?[0].productName!}",
      //                             maxLines: 2,
      //                             overflow: TextOverflow.fade,
      //                             style: TextStyle(
      //                                 color: Colors.black,
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ),
      //                       trailing: Transform.translate(
      //                         offset: Offset(12, 0),
      //                         child: SizedBox(
      //                           width: 50,
      //                           child: Row(
      //                             children: [
      //                               FittedBox(
      //                                 fit: BoxFit.contain,
      //                                 child: Text(
      //                                   "Edit",
      //                                   style: TextStyle(
      //                                     color: Colors.pinkAccent,
      //                                   ),
      //                                 ),
      //                               ),
      //                               Icon(
      //                                 Icons.expand_more,
      //                                 size: 18,
      //                                 color: Colors.red,
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   // Row(
      //                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   //   crossAxisAlignment: CrossAxisAlignment.center,
      //                   //   children: [
      //                   //     Text("Farm Vila Pizza"),
      //                   //     Icon(Icons.delete),
      //                   //   ],
      //                   // ),
      //                   // Expanded(
      //                   //   child: Row(
      //                   //     mainAxisAlignment: MainAxisAlignment.start,
      //                   //     crossAxisAlignment: CrossAxisAlignment.center,
      //                   //     children: [
      //                   //       FittedBox(
      //                   //         fit: BoxFit.contain,
      //                   //         child: Text(
      //                   //           "2 Dish",
      //                   //           overflow: TextOverflow.fade,
      //                   //           maxLines: 2,
      //                   //           style: TextStyle(
      //                   //               color: Colors.black54, fontSize: 15),
      //                   //         ),
      //                   //       ),
      //                   //       SizedBox(
      //                   //         width: 5,
      //                   //       ),
      //                   //       Expanded(
      //                   //         child: Align(
      //                   //           alignment: Alignment.centerLeft,
      //                   //           child: FittedBox(
      //                   //             fit: BoxFit.contain,
      //                   //             child: Text("Medium(9 inches)",
      //                   //                 overflow: TextOverflow.fade,
      //                   //                 softWrap: false,
      //                   //                 maxLines: 2,
      //                   //                 style: TextStyle(
      //                   //                     color: Colors.black54,
      //                   //                     fontSize: 15)),
      //                   //           ),
      //                   //         ),
      //                   //       ),
      //                   //     ],
      //                   //   ),
      //                   // ),

      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Expanded(
      //                         child: Align(
      //                           alignment: Alignment.centerLeft,
      //                           child: FittedBox(
      //                             fit: BoxFit.none,
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.start,
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 val.singleProduct!.messages!.status!
      //                                             .productDtls?[0].salesPrice ==
      //                                         null
      //                                     ? SizedBox()
      //                                     : Text.rich(TextSpan(children: [
      //                                         TextSpan(
      //                                             text: "\u{20B9}",
      //                                             style: TextStyle(
      //                                               decoration: TextDecoration
      //                                                   .lineThrough,
      //                                               color: Colors.black,
      //                                               fontSize: 16,
      //                                               fontWeight: FontWeight.bold,
      //                                             )),
      //                                         TextSpan(
      //                                             text:
      //                                                 "${val.singleProduct!.messages!.status!.productDtls?[0].salesPrice}",
      //                                             style: TextStyle(
      //                                                 decoration: TextDecoration
      //                                                     .lineThrough,
      //                                                 color: Colors.pinkAccent
      //                                                     .withOpacity(0.5),
      //                                                 fontSize: 16,
      //                                                 fontWeight:
      //                                                     FontWeight.bold))
      //                                       ])),
      //                                 SizedBox(
      //                                   width: 10,
      //                                 ),
      //                                 Text.rich(TextSpan(children: [
      //                                   TextSpan(
      //                                       text: "\u{20B9}",
      //                                       style: TextStyle(
      //                                         color: Colors.black,
      //                                         fontSize: 16,
      //                                         fontWeight: FontWeight.bold,
      //                                       )),
      //                                   TextSpan(
      //                                       text:
      //                                           "${val.singleProduct!.messages!.status!.productDtls?[0].regularPrice}",
      //                                       style: TextStyle(
      //                                           color: Colors.pinkAccent,
      //                                           fontSize: 16,
      //                                           fontWeight: FontWeight.bold))
      //                                 ])),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 70,
      //                         child: Column(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceAround,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             SizedBox(
      //                               height: 30,
      //                               width: 40,
      //                               child: FittedBox(
      //                                 fit: BoxFit.fill,
      //                                 child: Switch(
      //                                   inactiveTrackColor: Colors.red,
      //                                   inactiveThumbColor: Colors.white,
      //                                   value: val
      //                                               .singleProduct!
      //                                               .messages!
      //                                               .status!
      //                                               .productDtls?[0]
      //                                               .status ==
      //                                           "0"
      //                                       ? true
      //                                       : false,
      //                                   onChanged: (bool value) =>
      //                                       productStsUpdate(
      //                                           val
      //                                               .singleProduct!
      //                                               .messages!
      //                                               .status!
      //                                               .productDtls?[0]
      //                                               .productId,
      //                                           val
      //                                                       .singleProduct!
      //                                                       .messages!
      //                                                       .status!
      //                                                       .productDtls?[0]
      //                                                       .status ==
      //                                                   "0"
      //                                               ? "1"
      //                                               : "0"),
      //                                 ),
      //                               ),
      //                             ),
      //                             FittedBox(
      //                                 child: Text(
      //                               "${val.singleProduct!.messages!.status!.productDtls?[0].status == "0" ? "Available" : "Not Available"}",
      //                               style: TextStyle(
      //                                   color: val
      //                                               .singleProduct!
      //                                               .messages!
      //                                               .status!
      //                                               .productDtls?[0]
      //                                               .status ==
      //                                           "1"
      //                                       ? Colors.red
      //                                       : Colors.blue),
      //                             ))
      //                           ],
      //                         ),
      //                       )
      //                     ],
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         );
      // }),
    );
  }
}
