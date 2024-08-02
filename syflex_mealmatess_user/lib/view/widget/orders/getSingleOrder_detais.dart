import 'package:flutter/material.dart';

class GetSingleOrderDetails extends StatelessWidget {
  Map OrderSumery;
  GetSingleOrderDetails({required this.OrderSumery, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 35,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: FittedBox(
          child: Text(
            "Order Summary #${OrderSumery["order_id"]}",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${OrderSumery["address_dtls"][0]["first_name"] ?? ""} ${OrderSumery["address_dtls"][0]["last_name"] ?? ""}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Address1: ${OrderSumery["address_dtls"][0]["address1"] ?? ""} \n Address2:  ${OrderSumery["address_dtls"][0]["adress2"] ?? ""} \n phoneNo: ${OrderSumery["address_dtls"][0]["number"]}",
                    maxLines: 4,
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your Order"),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 1.0,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          onPressed: () {},
                          child: Text("MARK AS FAVORITE"))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: OrderSumery["order_dtls"]!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${OrderSumery["order_dtls"][index]["productname"] ?? ""}"),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green)),
                                  child: Center(
                                    child: Text(
                                      "${OrderSumery["order_dtls"][index]["qty"] ?? "1"}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.close,
                                  size: 15,
                                ),
                                Text(
                                    "\u{20B9}${OrderSumery["order_dtls"][index]["price"] ?? "0"}"),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("\u{20B9}${1000}")))
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              )
            ]),
      ),
    );
  }
}
