import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/orderProvider.dart';

class prcessingorder extends StatefulWidget {
  const prcessingorder({super.key});

  @override
  State<prcessingorder> createState() => _prcessingorderState();
}

class _prcessingorderState extends State<prcessingorder> {
  @override
  void initState() {
    // TODO: implement initState
    allNewOrder();
    super.initState();
  }

  allNewOrder() async {
    var provider = await Provider.of<OrderProvider>(context, listen: false);
    await provider.deliveryBoyAllordeer();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<OrderProvider>(builder: (context, val, chid) {
        // print(val.newOrderDeieryboy!.toJson());
        return val.newOrderDeieryboy != null
            ? RefreshIndicator(
                onRefresh: () => allNewOrder(),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: val.allOrderDeliveryboy!.data.orderdtls.length,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order #689"),
                                Text("02:01:2024")
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Name '),
                                  TextSpan(
                                    text: 'Dibyajyoti Ranjan',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                    onPressed: () {}, child: Text("Detail")),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Completed Orders",
                                    style: TextStyle(color: Colors.green),
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
    );
  }
}
