import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_meamates/screen/order_screen.dart';

import '../../provider/orderProvider.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    allNewOrder();
    super.initState();
  }

  allNewOrder() async {
    var provider = await Provider.of<OrderProvider>(context, listen: false);
    await provider.deliveryBoyNewordeer(area: "rasulgarh");
  }

  orderUpdate({orderId, status}) async {
    // print("update");
    var provider = await Provider.of<OrderProvider>(context, listen: false);
    await provider.deliveryBoyOrderUpdate(orderid: orderId, status: status);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<OrderProvider>(builder: (context, val, chid) {
            // print(val.newOrderDeieryboy!.toJson());
            return val.newOrderDeieryboy != null
                ? RefreshIndicator(
                    onRefresh: () => allNewOrder(),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            val.newOrderDeieryboy!.data!.orderdtls!.length,
                        itemBuilder: (context, int) {
                          return Container(
                            height: 200,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black12)),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Order #${val.newOrderDeieryboy!.data!.orderdtls![int].orderId}"),
                                    Text("02:01:2024")
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Name '),
                                      TextSpan(
                                        text:
                                            '${val.newOrderDeieryboy!.data!.orderdtls![int].customerFullName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Pickup Location '),
                                      TextSpan(
                                        text: 'SaheedNagar Bus stand',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Draft Location '),
                                      TextSpan(
                                        text: 'Cuttack bdam badi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => orderUpdate(
                                          orderId: val.newOrderDeieryboy!.data!
                                              .orderdtls![int].orderId,
                                          status: "7"),
                                      child: Text(
                                        "Acept",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Rejected",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.redAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ],
      ),
    );
  }
}
