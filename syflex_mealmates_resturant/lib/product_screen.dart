import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmates_resturant/add_new_product.dart';
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/model/resturant_product_mdel.dart';
import 'package:syflex_mealmates_resturant/product_menu.dart';
import 'package:syflex_mealmates_resturant/provider/restturantProductProvider.dart';
import 'package:syflex_mealmates_resturant/provider/resturant-product_provider.dart';

class ProductScreen extends StatefulWidget {
  // const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // late StreamController _numberStreamController;
  // late bool _enable = provider.resturantproducts!.messages!.status!.productDtls?[index]. == "0" ? true : false;
  // late String valu = _enable ? "Available" : "Not Available";
  String resturant_name = "";
  TextEditingController resturant = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    final provider =
        Provider.of<ResturantproductProvider>(context, listen: false);
    provider.getproduct();
    super.initState();
    //

    //
    // _numberStreamController = StreamController();
    // AllData();
    // _numberStreamController;
  }

  Validate(input) {
    if (input.isEmpty) {
      return 'Please type something';
    }
    return null;
  }

  submitForm(formkey) async {
    final formState = formKey.currentState;
    var provider =
        Provider.of<ResturatProductListProvider>(context, listen: false);
    if (formState!.validate()) {
      // formState.save();
      await provider.AddNewResurantProduct(resturant.text.toString())
          .then((value) {
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewProduct(
                      product: {"product_name": resturant.text.toString()}, //
                    )));
      });

      // print(resturant.text.toString());
      // then do something
    } else {
      print("Sorry");
    }
  }

  productStsUpdate(id, status) async {
    var provider =
        Provider.of<ResturantproductProvider>(context, listen: false);
    await provider.getSingleProductStsUpdate(id, status);
    await provider.getproduct();
    //await SyflexMealmatesRepository().ProductStatusUpdate(id, status);
    //widget.updateState("update the states");
    //setState(() {});
  }

  showAddProduct() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Product Name",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          width: double.infinity,
                          child: TextFormField(
                            autocorrect: true,
                            controller: resturant,
                            // onSaved: ((newValue) =>
                            //     setState(() => resturant_name = newValue!)),
                            maxLines: 1,
                            //controller: number,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                // label: Text("Contact No"),
                                // floatingLabelBehavior: FloatingLabelBehavior.always,
                                // floatingLabelStyle: TextStyle(),
                                hintText: "Paneer Masala",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16),
                                contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 5),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2))),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () => submitForm(formKey),
                          child: Text("Submit",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)))),
                ],
              ),
            ),
          );
        });
  }

  // AllData() async {
  //   var data = await SyflexMealmatesRepository().Allproduct();

  //   _numberStreamController.sink.add(data);
  // }

  // @override
  // void dispose() {
  //   _numberStreamController.close();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Resttur>(context);
    // print("object");
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: () => Navigator.pop(context),
        //   child: Icon(Icons.arrow_back),
        // ),
        title: Text("Product Menu"),
      ),
      floatingActionButton: Container(
        width: 150,
        decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: FittedBox(
                child: Text(
                  "Add Menu",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                onPressed: () {
                  showAddProduct();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AddNewProduct()));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      body:
          Consumer<ResturantproductProvider>(builder: (context, value, widge) {
        return value.isloading
            ? Center(
                child: widge,
              )
            : value.resturantproducts == null
                ? Text("Data is Null")
                : SingleChildScrollView(
                    padding: EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // itemCount: 2,
                        itemCount: value.resturantproducts?.messages?.status
                            ?.productDtls?.length,
                        itemBuilder: (context, index) {
                          // return PruductMenu_single(
                          //   product_id: value.resturantproducts!.messages!
                          //       .status!.productDtls![index].productId
                          //       .toString(),
                          //   product: value.resturantproducts!.messages!.status!
                          //       .productDtls![index]
                          //       .toJson(),
                          // );
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
                                value.resturantproducts!.messages!.status!
                                            .productDtls?[index].primaryImage ==
                                        null
                                    ? Icon(
                                        Icons.image_outlined,
                                        size: 100,
                                      )
                                    : Container(
                                        height: 100,
                                        width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: CachedNetworkImageProvider(
                                                    "https://collegeprojectz.com/mealmate/uploads/${value.resturantproducts!.messages!.status!.productDtls?[index].primaryImage}")),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.pinkAccent),
                                        // child: Image.network(
                                        //   "https://collegeprojectz.com/mealmate/uploads/${widget.product_item!["primary_image"]}",
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
                                      Expanded(
                                        child: ListTile(
                                          dense: true,
                                          selected: true,
                                          selectedColor: Colors.blue,
                                          minLeadingWidth: 10,
                                          horizontalTitleGap: 0,
                                          minVerticalPadding: 0,
                                          visualDensity: VisualDensity(
                                              horizontal: 0, vertical: -4),
                                          contentPadding: EdgeInsets.zero,
                                          leading: FittedBox(
                                            child: Icon(
                                              Icons.radio_button_checked,
                                              color: value
                                                          .resturantproducts!
                                                          .messages!
                                                          .status!
                                                          .productDtls?[index]
                                                          .foodType ==
                                                      "1"
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                          title: Align(
                                            alignment: Alignment.centerLeft,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                value
                                                            .resturantproducts!
                                                            .messages!
                                                            .status!
                                                            .productDtls![index]
                                                            .productName!
                                                            .length >
                                                        24
                                                    ? ("${value.resturantproducts!.messages!.status!.productDtls?[index].productName}")
                                                        .substring(0, 24)
                                                    : "${value.resturantproducts!.messages!.status!.productDtls?[index].productName!}",
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          trailing: Transform.translate(
                                            offset: Offset(12, 0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddNewProduct(
                                                              product: value
                                                                  .resturantproducts!
                                                                  .messages!
                                                                  .status!
                                                                  .productDtls![
                                                                      index]
                                                                  .toJson(),
                                                            )));
                                              },
                                              child: SizedBox(
                                                width: 50,
                                                child: Row(
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.pinkAccent,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.expand_more,
                                                      size: 18,
                                                      color: Colors.red,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //             //             // Row(
                                      //             //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //             //             //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //             //             //   children: [
                                      //             //             //     Text("Farm Vila Pizza"),
                                      //             //             //     Icon(Icons.delete),
                                      //             //             //   ],
                                      //             //             // ),
                                      //             //             // Expanded(
                                      //             //             //   child: Row(
                                      //             //             //     mainAxisAlignment:
                                      //             //             //         MainAxisAlignment.start,
                                      //             //             //     crossAxisAlignment:
                                      //             //             //         CrossAxisAlignment.center,
                                      //             //             //     children: [
                                      //             //             //       FittedBox(
                                      //             //             //         fit: BoxFit.contain,
                                      //             //             //         child: Text(
                                      //             //             //           "2 Dish",
                                      //             //             //           overflow: TextOverflow.fade,
                                      //             //             //           maxLines: 2,
                                      //             //             //           style: TextStyle(
                                      //             //             //               color: Colors.black54,
                                      //             //             //               fontSize: 15),
                                      //             //             //         ),
                                      //             //             //       ),
                                      //             //             //       SizedBox(
                                      //             //             //         width: 5,
                                      //             //             //       ),
                                      //             //             //       Expanded(
                                      //             //             //         child: Align(
                                      //             //             //           alignment: Alignment.centerLeft,
                                      //             //             //           child: FittedBox(
                                      //             //             //             fit: BoxFit.contain,
                                      //             //             //             child: Text(
                                      //             //             //                 "Medium(9 inches)",
                                      //             //             //                 overflow:
                                      //             //             //                     TextOverflow.fade,
                                      //             //             //                 softWrap: false,
                                      //             //             //                 maxLines: 2,
                                      //             //             //                 style: TextStyle(
                                      //             //             //                     color: Colors.black54,
                                      //             //             //                     fontSize: 15)),
                                      //             //             //           ),
                                      //             //             //         ),
                                      //             //             //       ),
                                      //             //             //     ],
                                      //             //             //   ),
                                      //             //             // ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                fit: BoxFit.none,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    value
                                                                .resturantproducts!
                                                                .messages!
                                                                .status!
                                                                .productDtls?[
                                                                    index]
                                                                .regularPrice ==
                                                            null
                                                        ? SizedBox()
                                                        : Text.rich(
                                                            TextSpan(children: [
                                                            TextSpan(
                                                                text:
                                                                    "\u{20B9}",
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                )),
                                                            TextSpan(
                                                                text:
                                                                    "${value.resturantproducts!.messages!.status!.productDtls?[index].salesPrice}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    color: Colors
                                                                        .pinkAccent
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))
                                                          ])),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text.rich(
                                                        TextSpan(children: [
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
                                                              "${value.resturantproducts!.messages!.status!.productDtls?[index].regularPrice}",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .pinkAccent,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ])),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                  width: 40,
                                                  child: FittedBox(
                                                    fit: BoxFit.fill,
                                                    child: Switch(
                                                      inactiveTrackColor:
                                                          Colors.red,
                                                      inactiveThumbColor:
                                                          Colors.white,
                                                      value: value
                                                                  .resturantproducts!
                                                                  .messages!
                                                                  .status!
                                                                  .productDtls?[
                                                                      index]
                                                                  .status ==
                                                              "0"
                                                          ? true
                                                          : false,
                                                      onChanged: (bool val) => value
                                                              .cloading
                                                          ? null
                                                          : productStsUpdate(
                                                              value
                                                                  .resturantproducts!
                                                                  .messages!
                                                                  .status!
                                                                  .productDtls?[
                                                                      index]
                                                                  .productId,
                                                              value
                                                                          .resturantproducts!
                                                                          .messages!
                                                                          .status!
                                                                          .productDtls?[
                                                                              index]
                                                                          .status ==
                                                                      "0"
                                                                  ? "1"
                                                                  : "0"),
                                                    ),
                                                  ),
                                                ),
                                                FittedBox(
                                                    child: Text(
                                                  "${value.resturantproducts!.messages!.status!.productDtls?[index].status == "0" ? "Available" : "Not Available"}",
                                                  style: TextStyle(
                                                      color: value
                                                                  .resturantproducts!
                                                                  .messages!
                                                                  .status!
                                                                  .productDtls?[
                                                                      index]
                                                                  .status ==
                                                              "1"
                                                          ? Colors.red
                                                          : Colors.blue),
                                                ))
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
                        }),
                  );
      }),
      // PruductMenu_single(
      // product_item: snapshot.data["messages"]["status"]
      //     ["product_dtls"][index],
      // ),
      // body: SingleChildScrollView(
      //   padding: EdgeInsets.all(8.0),
      //   child: StreamBuilder(
      //       stream: _numberStreamController.stream,
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return Center(child: CircularProgressIndicator());
      //         } else if (snapshot.hasError) {
      //           return Text(
      //               'Error: ${snapshot.error}'); // Display an error message if an error occurs.
      //         } else if (!snapshot.hasData) {
      //           return Text(
      //               'No data available'); // Display a message when no data is available.
      //         } else {
      //           return ListView.builder(
      //               shrinkWrap: true,
      //               physics: NeverScrollableScrollPhysics(),
      //               itemCount: snapshot
      //                   .data["messages"]["status"]["product_dtls"].length,
      //               itemBuilder: (context, index) {
      //                 return PruductMenu_single(
      //                     product_item: snapshot.data["messages"]["status"]
      //                         ["product_dtls"][index],
      //                     updateState: (value) {
      //                       AllData();
      //                       print(value);
      //                       setState(() {});
      //                     });
      //               });
      //         }
      //       }),
      // ),
    );
  }
}
