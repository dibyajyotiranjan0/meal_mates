import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/single_order_details.dart';

class VerifyOrder_Details extends StatefulWidget {
  String OrderId;
  VerifyOrder_Details({required this.OrderId, super.key});

  @override
  State<VerifyOrder_Details> createState() => _VerifyOrder_DetailsState();
}

class _VerifyOrder_DetailsState extends State<VerifyOrder_Details> {
  late StreamController _numberStreamController;
  OtpFieldController otpController = OtpFieldController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberStreamController = StreamController();
    AllData();
  }

  String? deliveryOtp;

  AllData() async {
    var data =
        await SyflexMealmatesRepository().Singleorderdetails(widget.OrderId);
    _numberStreamController.add(data);
  }

  veryfy_otp(String otp) {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) {
    //     return Container(
    //       alignment: Alignment.center,
    //       height: 100,
    //       width: 100,
    //       color: Colors.transparent,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.white,
    //         ),
    //       ),
    //     );
    //   },
    // );
    deliveryOtp != null && deliveryOtp.toString() == otp.toString()
        ? stsUpdate(widget.OrderId, "5")
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('OTP is Wrong, Please enter a valid OTP'),
          ));
    // print(widget.OrderId);
  }

  stsUpdate(String id, String satus) async {
    await SyflexMealmatesRepository().OrderStatusUpdate(id, satus);

    AllData();
    setState(() {});
  }

  @override
  void dispose() {
    _numberStreamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        leadingWidth: 40,
        title: Text(
          "order id:#9858473210",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
          stream: _numberStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Display an error message if an error occurs.
            } else if (!snapshot.hasData) {
              return Text(
                  'No data available'); // Display a message when no data is available.
            } else {
              return SingleChildScrollView(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot
                            .data["messages"]["status"]["Items_details"].length,
                        itemBuilder: (context, int) {
                          return VerifyOrder_item_single(
                              product: snapshot.data["messages"]["status"]
                                  ["Items_details"][int]);
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer Details",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                              "${snapshot.data["messages"]["status"]["Customer_dtls"][0]["full_name"]}"),
                          Text(
                              "${snapshot.data["messages"]["status"]["Customer_dtls"][0]["contact_no"]}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Partner Details",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                              "${snapshot.data["messages"]["status"]["Orderdtls"][0]["full_name"]}"),
                          Text(
                              "${snapshot.data["messages"]["status"]["Deliveryboy_dtls"][0]["contact_no"]}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address Details",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Full Name:"),
                              Text(
                                "${snapshot.data["messages"]["status"]["Addressdtls"][0]["first_name"]} ${snapshot.data["messages"]["status"]["Addressdtls"][0]["last_name"]}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Adress1: "),
                              Expanded(
                                child: Text(
                                  "${snapshot.data["messages"]["status"]["Addressdtls"][0]["state"]}, ${snapshot.data["messages"]["status"]["Addressdtls"][0]["cityname"]}, ${snapshot.data["messages"]["status"]["Addressdtls"][0]["address1"]}${snapshot.data["messages"]["status"]["Addressdtls"][0]["pincode"]}",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Adress2: "),
                              Expanded(
                                child: Text(
                                  "${snapshot.data["messages"]["status"]["Addressdtls"][0]["state"]}, ${snapshot.data["messages"]["status"]["Addressdtls"][0]["cityname"]}, ${snapshot.data["messages"]["status"]["Addressdtls"][0]["adress2"]}${snapshot.data["messages"]["status"]["Addressdtls"][0]["pincode"]}",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone Number:"),
                              Text(
                                  "${snapshot.data["messages"]["status"]["Addressdtls"][0]["number"]}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    int.parse(snapshot.data["messages"]["status"]["Orderdtls"]
                                [0]["status"]) <
                            5
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, bottom: 20, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Enter Delivery Code"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    OTPTextField(
                                        controller: otpController,
                                        length: 4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        textFieldAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        fieldWidth: 50,
                                        fieldStyle: FieldStyle.box,
                                        outlineBorderRadius: 15,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                        // onChanged: (pin) {
                                        //   print("Changed: " + pin);
                                        // },
                                        onCompleted: (pin) {
                                          deliveryOtp = pin.toString();

                                          // print("Completed: " + pin);
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => deliveryOtp == 4
                                        ? veryfy_otp(
                                            "${snapshot.data["messages"]["status"]["Orderdtls"][0]["otp"]}")
                                        : null,
                                    child: Text(
                                      "Verify",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                  )),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              );
            }
          }),
    );
  }
}
